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
  gke_name                = var.gke_name
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
}

