

resource "google_compute_firewall" "tf-firewall" {
  name    = var.firewall_name
  network = var.vpc_network_id

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  source_tags =  var.source_tags != [] ? var.source_tags : null
  source_ranges = var.source_ranges != [] ? var.source_ranges : null
}

