#VPC variables
vpc_name                            = "argo-mgmt-vpc"
subnet_name                         = "argo-mgmt-subnet"
firewall_name                       = "fir-argo-mgmt"
vpc_regions                         = ["us-east1", "us-central1", "us-west1"]
vpc_description                     = "VPC para ambiente de producao"
vpc_routing_mode                    = "REGIONAL"
vpc_auto_create_subnetworks         = false
vpc_delete_default_routes_on_create = false
vpc_mtu                             = 1460
vpc_enable_ula_internal_ipv6        = false

# GKE variables
gke_name                          = "argo-mgmt"
gke_location                      = "us-west1"
gke_node_count                    = 1
gke_network                       = "argo-mgmt-vpc"
gke_subnet                        = "subnet-us-west1"
gke_disk_size                     = 30
gke_disk_type                     = "pd-standard"
gke_type_node                     = "e2-standard-4"
gke_deletion_protection           = false
node_locations                    = ["us-west1-b", "us-west1-c"]
project_id                        = "argo-prod-471308"
auto_scaling_min_node_count       = 1
auto_scaling_max_node_count       = 8
gke_count                         = 1
project_number                    = "339625283606"
gke_enable_secondary_ranges       = true
gke_pods_secondary_range_name     = "pods-argo-prod"
gke_pods_secondary_range_cidr     = "10.110.0.0/17"
gke_services_secondary_range_name = "services-argo-prod"
gke_services_secondary_range_cidr = "10.210.0.0/22"

#service_account_kubernetes = "external-secrets"
#namespace_external_secrets  = "external-secrets"

# SQL variables
sql_instance_name             = "sql-argo-mgmt"
sql_instance_region           = "us-west1"
sql_instance_database_version = "POSTGRES_14"
sql_deletion_protection       = false
sql_disk_autoresize           = true
sql_tier                      = "db-f1-micro"
sql_ip_public_enabled         = false
sql_backup_start_time         = "03:00"
retained_backups              = 7
retention_unit                = "COUNT"
sql_backup_region             = "us-central1"