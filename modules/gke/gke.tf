
resource "google_container_cluster" "primary" {
  name                = var.gke_name
  location            = var.gke_location
  network             = var.gke_network
  subnetwork          = var.gke_subnet
  deletion_protection = var.gke_deletion_protection
  initial_node_count  = 1
  remove_default_node_pool = true

  timeouts {
    create = "30m"
    update = "40m"
  }
}