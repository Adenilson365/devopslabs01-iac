# # terraform {
# #   required_providers {
# #     google = {
# #       source  = "hashicorp/google"
# #       version = "6.5.0"
# #     }
# #   }
# # }

module "vpc" {
  source = "./modules/network/vpc"
  vpc_name   = var.vpc_name
  project_id = var.project_id
  vpc_description = "VPC criada para testes"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
  delete_default_routes_on_create = false
  mtu = 1460
  enable_ula_internal_ipv6 = false
}

module "subnet" {
  source = "./modules/network/subnet"
  subnet_name = "subnet-${count.index}"
  vpc_network_id = module.vpc.id
  ip_cidr_range = "10.${count.index}.0.0/20"
  vpc_region = var.vpc_regions[count.index]
  enable_secondary_ranges = var.gke_enable_secondary_ranges && count.index == 0
  pods_secondary_ip_range_name = count.index == 0 ? var.gke_pods_secondary_range_name : null
  pods_secondary_ip_cidr_range = count.index == 0 ? var.gke_pods_secondary_range_cidr : null
  services_secondary_ip_range_name = count.index == 0 ? var.gke_services_secondary_range_name : null
  services_secondary_ip_cidr_range = count.index == 0 ? var.gke_services_secondary_range_cidr : null
  count = length(var.vpc_regions)
  depends_on = [ module.vpc ]
}

module "firewall" {
  source = "./modules/network/firewall"
  firewall_name   = "allow-internal-icmp"
  vpc_network_id  = module.vpc.id
  protocol        = "tcp"
  ports           = ["8080","443", "80"]
  source_ranges = ["0.0.0.0/0"]
  depends_on = [ module.subnet ]
}


module "gke" {
  source                      = "./modules/gke"
  gke_name                    = "${var.gke_name}-${count.index}"
  gke_location                = var.gke_location
  gke_node_count              = var.gke_node_count
  gke_service_account         = var.gke_service_account
  gke_network                 = module.vpc.id
  gke_subnet                  = module.subnet[0].subnet_self_link
  gke_disk_size               = var.gke_disk_size
  gke_disk_type               = var.gke_disk_type
  gke_type_node               = var.gke_type_node
  gke_deletion_protection     = var.gke_deletion_protection
  node_locations              = var.node_locations
  project_id                  = var.project_id
  auto_scaling_min_node_count = var.auto_scaling_min_node_count
  auto_scaling_max_node_count = var.auto_scaling_max_node_count
  count                       = var.gke_count
  project_number              = var.project_number
  gke_min_master_version      = "1.30.12-gke.1372000"
  gke_pods_secondary_range_name     = var.gke_pods_secondary_range_name
  gke_services_secondary_range_name = var.gke_services_secondary_range_name
  depends_on                  = [module.vpc, module.subnet]
}




# module "sql" {
#   source                        = "./modules/sql"
#   sql_instance_name             = var.sql_instance_name
#   sql_instance_region           = var.sql_instance_region
#   sql_instance_database_version = var.sql_instance_database_version
#   sql_deletion_protection       = var.sql_deletion_protection
#   sql_intance_region            = "us-east1"
#   sql_disk_autoresize           = var.sql_disk_autoresize
#   sql_tier                      = var.sql_tier
#   sql_private_network           = module.network-gcp.vpc_self_link
#   sql_ip_public_enabled         = var.sql_ip_public_enabled
#   depends_on                    = [module.network-gcp, google_service_networking_connection.private_vpc_connection_01]
# }



# #Faixa de IP reservada para o peering
# resource "google_compute_global_address" "private_ip_range" {
#   name          = "private-sql-range"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   prefix_length = 24
#   network       = module.network-gcp.vpc_id
#   depends_on    = [module.network-gcp]
# }

# #Peering com o Service Networking
# resource "google_service_networking_connection" "private_vpc_connection_01" {
#   network                 = module.network-gcp.vpc_id
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]
#   lifecycle {
#     prevent_destroy = false # Evita que o Terraform tente destruir a conexão existente
#   }
#   depends_on = [module.network-gcp, google_compute_global_address.private_ip_range]
# }


# # teste bucket
# resource "google_storage_bucket" "bucket" {
#   project                     = var.project_id
#   name                        = "bucket-teste-adenilson-us-central1-${var.project_id}"
#   location                    = "US"
#   force_destroy               = true # apaga o bucket mesmo com arquivos dentro (útil em testes)
#   uniform_bucket_level_access = true # Habilita o acesso uniforme ao nível do bucket

# }

# resource "google_storage_bucket" "bucke2" {
#   project                     = var.project_id
#   name                        = "bucket-teste-adenilson-us-central1-bucket2-${var.project_id}"
#   location                    = "US"
#   force_destroy               = true # apaga o bucket mesmo com arquivos dentro (útil em testes)
#   uniform_bucket_level_access = true # Habilita o acesso uniforme ao nível do bucket

# }



# # resource "google_storage_bucket_iam_member" "member" {
# #   bucket = google_storage_bucket.bucket.name
# #   role   = "roles/storage.legacyObjectReader"
# #   member = "user:example@example.com"
# # }
