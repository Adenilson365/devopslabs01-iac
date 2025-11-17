variable "gke_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "strategy-rollout-rollback-gcp-tf"
}

variable "gke_location" {
  description = "The region in which the GKE cluster will be created"
  type        = string
  default     = "us-east1"
}

variable "gke_node_count" {
  description = "The number of nodes in the GKE cluster"
  type        = number
  default     = 1
}

variable "gke_service_account" {
  description = "The service account to use for the GKE cluster"
  type        = string
  default     = "default"

}
variable "gke_network" {
  description = "The network to use for the GKE cluster"
  type        = string
  default     = "default"

}

variable "gke_subnet" {
  description = "The subnet to use for the GKE cluster"
  type        = string
  default     = "default"

}

variable "gke_pods_secondary_range_name" {
  description = "The secondary range name for GKE Pods"
  type        = string
}

variable "gke_services_secondary_range_name" {
  description = "The secondary range name for GKE Services"
  type        = string
}
variable "gke_disk_size" {
  description = "The size of the disk for the GKE cluster"
  type        = number
  default     = 10

}

variable "gke_disk_type" {
  description = "The type of the disk for the GKE cluster"
  type        = string
  default     = "pd-standard"

}

variable "gke_deletion_protection" {
  description = "Whether or not to enable deletion protection for the GKE cluster"
  type        = bool
  default     = false

}

variable "gke_type_node" {
  description = "The type of the node for the GKE cluster"
  type        = string
  default     = "e2-medium"
}

variable "node_locations" {
  description = "The locations of the nodes in the GKE cluster"
  type        = list(string)
  default     = ["us-east1-c"]

}

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
  default     = "external-secrets"

}

variable "auto_scaling_min_node_count" {
  description = "The minimum number of nodes in the GKE cluster"
  type        = number
  default     = 1
}

variable "auto_scaling_max_node_count" {
  description = "The maximum number of nodes in the GKE cluster"
  type        = number
  default     = 3
}

variable "project_number" {
  description = "The project number"
  type        = string

}

variable "gke_min_master_version" {
  description = "The minimum master version for the GKE cluster"
  type        = string
  default     = "1.32.6-gke.1060000"
}
variable "gke_node_version" {
  description = "The version of the nodes in the GKE cluster"
  type        = string
  default     = "1.32.6-gke.1060000"
}
