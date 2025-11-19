resource "google_container_node_pool" "pool" {
  name       = var.nodepool_name
  cluster    = var.gke_cluster_id
  node_count = var.gke_node_count


  management {
    auto_repair  = false
    auto_upgrade = true
  }

  node_config {
    preemptible     = var.node_config_preemptible # Cria VMs mais baratas, mas que podem ser desligadas a qualquer momento pelo Google (parecido com Spot)
    machine_type    = var.gke_type_node
    service_account = var.gke_service_account
    disk_size_gb    = var.gke_disk_size
    disk_type       = var.gke_disk_type


    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }
  autoscaling {
    min_node_count = var.auto_scaling_min_node_count
    max_node_count = var.auto_scaling_max_node_count
  }

}


