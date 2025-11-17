#VPC variables
vpc_name      = "vpc-devops-labs01"
subnet_name   = "sub-devops-labs01"
firewall_name = "fir-devops-labs01"
vpc_regions   = ["us-east1", "us-central1", "us-west1"]

# GKE variables
gke_name       = "devops-labs01"
gke_location   = "us-east1"
gke_node_count = 1


gke_disk_size               = 30
gke_disk_type               = "pd-standard"
gke_type_node               = "e2-standard-4"
gke_deletion_protection     = false
node_locations              = ["us-east1-b", "us-east1-c", "us-east1-d"]
project_id                  = "knz-lab"
auto_scaling_min_node_count = 1
auto_scaling_max_node_count = 8
gke_count                   = 1
gke_enable_secondary_ranges       = true
gke_pods_secondary_range_name     = "pods-devops-labs01"
gke_pods_secondary_range_cidr     = "10.100.0.0/17"
gke_services_secondary_range_name = "services-devops-labs01"
gke_services_secondary_range_cidr = "10.200.0.0/22"

# SQL variables
sql_instance_name             = "sql-devops-labs01"
sql_instance_region           = "us-east1"
sql_instance_database_version = "POSTGRES_14"
sql_deletion_protection       = false
sql_disk_autoresize           = true
sql_tier                      = "db-f1-micro"
sql_ip_public_enabled         = false
