
#Cria a conta de serviço do Google Cloud, no IAM.
resource "google_service_account" "service_account" {
  account_id   = var.google_service_account_id
  display_name = var.google_service_account_display_name
  project      = var.project_id
}

# Dá permissão para a conta de serviço do GKE acessar recursos do Google Cloud.
# As permissões são vinculadas a conta Google.
resource "google_project_iam_member" "wk_roles" {
  for_each = toset(var.wk_iam_roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

# Vincula a conta de serviço do Kubernetes (GKE) com a conta de serviço do Google Cloud.
# Permite que a conta no k8s assuma a conta IAM do google.
resource "google_service_account_iam_member" "k8s_service_account" {
  service_account_id = google_service_account.service_account.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace_kubernetes}/${var.service_account_kubernetes}]"
}

