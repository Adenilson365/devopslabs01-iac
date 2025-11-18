

resource "google_container_cluster" "primary" {
  name                     = var.gke_name
  location                 = var.gke_location
  network                  = var.gke_network
  subnetwork               = var.gke_subnet
  deletion_protection      = var.gke_deletion_protection
  remove_default_node_pool = true
  initial_node_count       = 1
  node_locations           = var.node_locations
  
  ip_allocation_policy {
    cluster_secondary_range_name  = var.gke_pods_secondary_range_name
    services_secondary_range_name = var.gke_services_secondary_range_name
  }
  

  timeouts {
    create = "30m"
    update = "40m"
  }
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

}
