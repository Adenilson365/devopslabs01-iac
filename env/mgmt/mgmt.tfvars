#VPC variables
vpc_name      = "argo-mgmt-vpc"
subnet_name   = "argo-mgmt-subnet"
firewall_name = "fir-argo-mgmt"
vpc_regions   = ["us-west1"]


# GKE variables
gke_name                    = "argo-mgmt"
gke_location                = "us-west1"
gke_node_count              = 1
gke_network                 = "argo-mgmt-vpc"
gke_subnet                  = "subnet-us-west1"
gke_disk_size               = 30
gke_disk_type               = "pd-standard"
gke_type_node               = "e2-standard-4"
gke_deletion_protection     = false
node_locations              = ["us-west1-b"]
project_id                  = "argo-mgmt"
auto_scaling_min_node_count = 1
auto_scaling_max_node_count = 5
gke_count                   = 1
project_number              = "937956068945"
#   gcloud projects describe <IdDoProjeto> --format="value(projectNumber)"

# # SQL variables
# sql_instance_name = "sql-devops-labs01"
# sql_instance_region = "us-east1"
# sql_instance_database_version = "POSTGRES_14"
# sql_deletion_protection = false
# sql_disk_autoresize = true
# sql_tier = "db-f1-micro"
# sql_ip_public_enabled = false