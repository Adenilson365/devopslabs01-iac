resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.gke_name
  cluster    = google_container_cluster.primary.id
  node_count = var.gke_node_count


  management {
    auto_repair  = false
    auto_upgrade = true
  }

  node_config {
    preemptible     = true # Cria VMs mais baratas, mas que podem ser desligadas a qualquer momento pelo Google (parecido com Spot)
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

  version = "1.32.6-gke.1060000"

}

resource "google_service_account" "secret_accessor" {
  account_id   = "eso-secret-accessor"
  display_name = "eso-secret-accessor"
  project      = var.project_id
  depends_on   = [google_container_cluster.primary]
}

resource "google_project_iam_member" "secretAccessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace_external_secrets}/${var.service_account_kubernetes}]"

}

resource "google_service_account_iam_member" "allow_k8s_assume" {
  service_account_id = google_service_account.secret_accessor.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace_external_secrets}/${var.service_account_kubernetes}]"
}


