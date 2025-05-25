#VPC variables
vpc_name      = "vpc-devops-labs01"
subnet_name   = "sub-devops-labs01"
firewall_name = "fir-devops-labs01"
vpc_regions   = ["us-east1", "us-central1", "us-west1"]

# GKE variables
gke_name       = "devops-labs01"
gke_location   = "us-east1"
gke_node_count = 2

gke_network                 = "vpc-devops-labs01"
gke_subnet                  = "subnet-us-east1"
gke_disk_size               = 30
gke_disk_type               = "pd-standard"
gke_type_node               = "e2-standard-4"
gke_deletion_protection     = false
node_locations              = ["us-east1-b"]
project_id                  = "knz-lab"
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