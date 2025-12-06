
module "vpc" {
  source                          = "./modules/network/vpc"
  vpc_name                        = var.vpc_name
  project_id                      = var.project_id
  vpc_description                 = var.vpc_description
  auto_create_subnetworks         = var.vpc_auto_create_subnetworks
  routing_mode                    = var.vpc_routing_mode
  delete_default_routes_on_create = var.vpc_delete_default_routes_on_create
  mtu                             = var.vpc_mtu
  enable_ula_internal_ipv6        = var.vpc_enable_ula_internal_ipv6
}

module "subnet" {
  source                           = "./modules/network/subnet"
  subnet_name                      = "subnet-${count.index}"
  vpc_network_id                   = module.vpc.id
  ip_cidr_range                    = "10.${count.index}.0.0/20"
  vpc_region                       = var.vpc_regions[count.index]
  enable_secondary_ranges          = var.gke_enable_secondary_ranges && count.index == 0
  pods_secondary_ip_range_name     = count.index == 0 ? var.gke_pods_secondary_range_name : null
  pods_secondary_ip_cidr_range     = count.index == 0 ? var.gke_pods_secondary_range_cidr : null
  services_secondary_ip_range_name = count.index == 0 ? var.gke_services_secondary_range_name : null
  services_secondary_ip_cidr_range = count.index == 0 ? var.gke_services_secondary_range_cidr : null
  count                            = length(var.vpc_regions)
  depends_on                       = [module.vpc]
}

# module "firewall" {
#   source         = "./modules/network/firewall"
#   firewall_name  = "allow-internal-icmp"
#   vpc_network_id = module.vpc.id
#   protocol       = "tcp"
#   ports          = ["8080", "443", "80"]
#   source_ranges  = ["0.0.0.0/0"]
#   depends_on     = [module.subnet]
# }


# module "firewall2" {
#   source         = "./modules/network/firewall"
#   firewall_name  = "allow-internal-2"
#   vpc_network_id = module.vpc.id
#   protocol       = "tcp"
#   ports          = ["8080", "443", "80","5432"]
#   source_ranges  = ["0.0.0.0/0"]
#   depends_on     = [module.subnet]
# }

module "gke_cluster" {
  source                            = "./modules/gke/master"
  gke_name                          = var.gke_name
  gke_location                      = var.gke_location
  gke_network                       = module.vpc.id
  gke_subnet                        = module.subnet[0].subnet_self_link
  gke_deletion_protection           = var.gke_deletion_protection
  node_locations                    = var.node_locations
  project_id                        = var.project_id
  count                             = var.gke_count
  gke_pods_secondary_range_name     = var.gke_pods_secondary_range_name
  gke_services_secondary_range_name = var.gke_services_secondary_range_name
  depends_on                        = [module.vpc, module.subnet]
  enable_fqdn_network_policy        = var.enable_fqdn_network_policy
  datapath_provider                 = var.datapath_provider
}

module "workload_identity" {
  source                              = "./modules/gke/workload_identity"
  project_id                          = var.project_id
  namespace_kubernetes                = "external-secrets"
  service_account_kubernetes          = "external-secrets"
  google_service_account_id           = "eso-secret-accessor"
  google_service_account_display_name = "External Secrets Operator Secret Accessor"
  wk_iam_roles                        = ["roles/secretmanager.admin"]
}

module "workload_identity_wk" {
  source                              = "./modules/gke/workload_identity"
  project_id                          = var.project_id
  namespace_kubernetes                = "wk-lab"
  service_account_kubernetes          = "ksa-wi-lab"
  google_service_account_id           = "wi-lab-sa"
  google_service_account_display_name = "compute list instances"
  wk_iam_roles                        = ["roles/compute.admin", "roles/storage.admin", "roles/cloudsql.admin"]
}

module "gke_nodepool_app" {
  source                      = "./modules/gke/nodepool"
  nodepool_name               = "np-app"
  project_number              = var.project_number
  gke_cluster_id              = module.gke_cluster[count.index].gke_cluster_id
  gke_node_count              = var.gke_node_count
  gke_service_account         = var.gke_service_account
  gke_disk_size               = var.gke_disk_size
  gke_disk_type               = var.gke_disk_type
  gke_type_node               = var.gke_type_node
  node_locations              = var.node_locations
  project_id                  = var.project_id
  auto_scaling_min_node_count = var.auto_scaling_min_node_count
  auto_scaling_max_node_count = var.auto_scaling_max_node_count
  count                       = var.gke_count
  depends_on                  = [module.gke_cluster]
}

# module "gke_nodepool_mon" {
#   source                      = "./modules/gke/nodepool"
#   nodepool_name               = "np-mon"
#   project_number              = var.project_number
#   gke_cluster_id              = module.gke_cluster[count.index].gke_cluster_id
#   gke_node_count              = 2
#   gke_service_account         = var.gke_service_account
#   gke_disk_size               = var.gke_disk_size
#   gke_disk_type               = var.gke_disk_type
#   gke_type_node               = "e2-medium"
#   node_locations              = var.node_locations
#   project_id                  = var.project_id
#   auto_scaling_min_node_count = var.auto_scaling_min_node_count
#   auto_scaling_max_node_count = var.auto_scaling_max_node_count
#   count                       = var.gke_count
#   depends_on                  = [module.gke_cluster]
# }



# module "sql" {
#   source                        = "./modules/sql"
#   sql_instance_name             = var.sql_instance_name
#   sql_instance_database_version = var.sql_instance_database_version
#   sql_deletion_protection       = var.sql_deletion_protection
#   sql_instance_region           = var.sql_instance_region
#   sql_disk_autoresize           = var.sql_disk_autoresize
#   sql_tier                      = var.sql_tier
#   sql_private_network           = module.vpc.self_link
#   sql_ip_public_enabled         = var.sql_ip_public_enabled
#   backup_enabled                = true
#   backup_start_time             = var.sql_backup_start_time
#   sql_backup_region             = var.sql_backup_region
#   retained_backups              = var.retained_backups
#   retention_unit                = var.retention_unit
#   depends_on                    = [module.vpc, google_service_networking_connection.private_vpc_connection_01]
# }



# #Faixa de IP reservada para o peering
# resource "google_compute_global_address" "private_ip_range" {
#   name          = "private-sql-range"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   prefix_length = 24

#   network    = module.vpc.id
#   depends_on = [module.vpc]
# }

# #Peering com o Service Networking
# resource "google_service_networking_connection" "private_vpc_connection_01" {
#   network                 = module.vpc.id
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]
#   lifecycle {
#     prevent_destroy = false # Evita que o Terraform tente destruir a conexão existente
#   }
#   depends_on = [module.vpc, google_compute_global_address.private_ip_range]
# }
