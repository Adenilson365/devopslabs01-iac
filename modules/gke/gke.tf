
# data "google_container_engine_versions" "central1b" {
#   provider       = google-beta
#   location       = "us-central1-b"
#   version_prefix = "1.32.6-gke.1060000"
# }

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
  # min_master_version       = "1.32.6-gke.1060000"
  # node_version              = "1.32.6-gke.1060000"




  # gke_auto_upgrade_config {

  #   patch_mode = "ACCELERATED"
  # }


  #   release_channel {
  #     channel = "UNSPECIFIED"

  #   }




  timeouts {
    create = "30m"
    update = "40m"
  }
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

}
