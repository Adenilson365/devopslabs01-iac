
variable "project_id" {
  description = "The project ID"
  type        = string
}

variable "namespace_kubernetes" {
  description = "The namespace of the external secrets"
  type        = string
}

variable "service_account_kubernetes" {
  description = "The service account for Kubernetes"
  type        = string
}

variable "google_service_account_id" {
  description = "ID service Account in Google Cloud Platform"
  type        = string
}
variable "google_service_account_display_name" {
  description = "Display name service Account in Google Cloud Platform"
  type        = string
}
variable "iam_role" {
  description = "The IAM role to be assigned"
  type        = string
}