resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.gke_name
  cluster    = google_container_cluster.primary.id
  node_count = var.gke_node_count

  node_config {
    preemptible     = true
    machine_type    = var.gke_type_node
    service_account = var.gke_service_account
    disk_size_gb    = var.gke_disk_size
    disk_type       = var.gke_disk_type
  }
}