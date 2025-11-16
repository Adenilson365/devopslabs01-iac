
resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "subnet-${var.subnet_name}"
  network       = var.vpc_network_id
  ip_cidr_range = var.ip_cidr_range
  region        = var.vpc_region
}


