
resource "google_service_account" "service_account" {
  account_id   = var.google_service_account_id
  display_name = var.google_service_account_display_name
  project      = var.project_id
}

resource "google_project_iam_member" "iam_member" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace_kubernetes}/${var.service_account_kubernetes}]"

}

resource "google_service_account_iam_member" "k8s_service_account" {
  service_account_id = google_service_account.service_account.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace_kubernetes}/${var.service_account_kubernetes}]"
}

