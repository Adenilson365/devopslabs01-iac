variable "gke_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "gke-terraform"
}

variable "gke_location" {
  description = "The region in which the GKE cluster will be created"
  type        = string
  default     = "us-east1"
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


variable "node_locations" {
  description = "The locations of the nodes in the GKE cluster"
  type        = list(string)
  default     = ["us-east1-c"]

}

variable "project_id" {
  description = "The project ID"
  type        = string
}


# Habilita network policy no cluster GKE
#https://docs.cloud.google.com/kubernetes-engine/docs/how-to/network-policy

variable "enable_fqdn_network_policy" {
  description = "Whether to enable FQDN network policy"
  type = bool
  default = true
}
# Define o datapath provider como ADVANCED_DATAPATH
variable "datapath_provider" {
  description = "It's necessary to enable network policy"
  type = string
  default = "ADVANCED_DATAPATH"
}