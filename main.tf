terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.5.0"
    }
  }
}

module "network-gcp" {
  source        = "./modules/network"
  vpc_name      = var.vpc_name
  subnet_name   = var.subnet_name
  firewall_name = var.firewall_name
  vpc_regions   = var.vpc_regions
}

module "gke" {
  source                  = "./modules/gke"
  gke_name                = "${var.gke_name}-${count.index}"
  gke_location            = var.gke_location
  gke_node_count          = var.gke_node_count
  gke_service_account     = var.gke_service_account
  gke_network             = var.gke_network
  gke_subnet              = var.gke_subnet
  gke_disk_size           = var.gke_disk_size
  gke_disk_type           = var.gke_disk_type
  gke_type_node           = var.gke_type_node
  gke_deletion_protection = var.gke_deletion_protection
  node_locations          = var.node_locations
  project_id              = var.project_id
  depends_on              = [module.network-gcp]
  auto_scaling_min_node_count = var.auto_scaling_min_node_count
  auto_scaling_max_node_count = var.auto_scaling_max_node_count
  count                  = var.gke_count
}




module "sql" {
  source = "./modules/sql"
  sql_instance_name = var.sql_instance_name
  sql_instance_region = var.sql_instance_region
  sql_instance_database_version = var.sql_instance_database_version
  sql_deletion_protection = var.sql_deletion_protection
  sql_intance_region = "us-east1"
  sql_disk_autoresize = var.sql_disk_autoresize
  sql_tier = var.sql_tier
  sql_private_network = module.network-gcp.vpc_self_link
  sql_ip_public_enabled = var.sql_ip_public_enabled
  depends_on = [module.network-gcp, google_service_networking_connection.private_vpc_connection_01]
}



#Faixa de IP reservada para o peering
resource "google_compute_global_address" "private_ip_range" {
  name          = "private-sql-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = module.network-gcp.vpc_id
  depends_on = [ module.network-gcp ]
}

#Peering com o Service Networking
resource "google_service_networking_connection" "private_vpc_connection_01" {
  network                 = module.network-gcp.vpc_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]
    lifecycle {
    prevent_destroy = false  # Evita que o Terraform tente destruir a conexão existente
  }
  depends_on = [ module.network-gcp, google_compute_global_address.private_ip_range ]
}

