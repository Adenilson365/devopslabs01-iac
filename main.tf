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
  vpc_name      = "vpc-devops-labs01"
  subnet_name   = "sub-devops-labs01"
  firewall_name = "fir-devops-labs01"
  vpc_regions   = ["us-east1"]
}

module "gke" {
  source                  = "./modules/gke"
  gke_name                = "devops-labs01"
  gke_location            = "us-east1"
  gke_node_count          = 1
  gke_service_account     = "terraform-linux-sa@devopslabs-442223.iam.gserviceaccount.com"
  gke_network             = module.network-gcp.vpc_name
  gke_subnet              = "subnet-us-east1"
  gke_disk_size           = 12
  gke_disk_type           = "pd-standard"
  gke_deletion_protection = false
  depends_on              = [module.network-gcp]
}