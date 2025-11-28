
resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnet_name
  network       = var.vpc_network_id
  ip_cidr_range = var.ip_cidr_range
  region        = var.vpc_region

  dynamic "secondary_ip_range" {
    for_each = var.enable_secondary_ranges ? [
      {
        range_name    = var.pods_secondary_ip_range_name
        ip_cidr_range = var.pods_secondary_ip_cidr_range
      },
      {
        range_name    = var.services_secondary_ip_range_name
        ip_cidr_range = var.services_secondary_ip_cidr_range
      }
    ] : []

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
}

