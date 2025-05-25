#VPC variables
vpc_name      = "argo-dev-vpc"
subnet_name   = "argo-dev-subnet"
firewall_name = "fir-argo-dev"
vpc_regions   = ["us-central1"]

# GKE variables
gke_name                    = "argo-dev"
gke_location                = "us-central1"
gke_node_count              = 1
gke_network                 = "argo-dev-vpc"
gke_subnet                  = "subnet-us-central1"
gke_disk_size               = 30
gke_disk_type               = "pd-standard"
gke_type_node               = "e2-standard-4"
gke_deletion_protection     = false
node_locations              = ["us-central1-b"]
project_id                  = "argo-dev-455710"
auto_scaling_min_node_count = 1
auto_scaling_max_node_count = 8
gke_count                   = 1
project_number              = "389450573049"
#   gcloud projects describe <IdDoProjeto> --format="value(projectNumber)"

# SQL variables
sql_instance_name             = "sql-devops-labs01"
sql_instance_region           = "us-central1"
sql_instance_database_version = "POSTGRES_14"
sql_deletion_protection       = false
sql_disk_autoresize           = true
sql_tier                      = "db-f1-micro"
sql_ip_public_enabled         = false