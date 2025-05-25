
variable "project_id" {
  description = "The project ID"
  type        = string
}

variable "namespace_external_secrets" {
  description = "The namespace of the external secrets"
  type        = string
  default     = "external-secrets"
}

variable "service_account_kubernetes" {
  description = "The service account for Kubernetes"
  type        = string
  default     = "external-secrets-sa"

}

variable "project_numer" {
  description = "The project number"
  type        = string
}