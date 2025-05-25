resource "google_project_iam_member" "secretmanager_accessor" {
  project = var.project_id

  role = "roles/secretmanager.secretAccessor"

  member = "principal://iam.googleapis.com/projects/${var.project_numer}}/locations/global/workloadIdentityPools/${var.project_id}.svc.id.goog/subject/ns/${var.namespace_external_secrets}/sa/${var.service_account_kubernetes}"
}

#gcloud projects describe <IdDoProjeto> --format="value(projectNumber)"
