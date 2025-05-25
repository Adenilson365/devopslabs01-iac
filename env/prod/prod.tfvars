#VPC variables
vpc_name      = "argo-prd-vpc"
subnet_name   = "argo-prd-subnet"
firewall_name = "fir-argo-prd"
vpc_regions   = ["us-east1"]

# GKE variables
gke_name                    = "argo-prd"
gke_location                = "us-east1"
gke_node_count              = 2
gke_network                 = "argo-prd-vpc"
gke_subnet                  = "subnet-us-east1"
gke_disk_size               = 30
gke_disk_type               = "pd-standard"
gke_type_node               = "e2-standard-4"
gke_deletion_protection     = false
node_locations              = ["us-east1-b"]
project_id                  = "argo-prd"
auto_scaling_min_node_count = 3
auto_scaling_max_node_count = 8
gke_count                   = 1

# SQL variables
sql_instance_name             = "sql-devops-labs01"
sql_instance_region           = "us-east1"
sql_instance_database_version = "POSTGRES_14"
sql_deletion_protection       = false
sql_disk_autoresize           = true
sql_tier                      = "db-f1-micro"
sql_ip_public_enabled         = false