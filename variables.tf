#VPC variables
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string

}
variable "firewall_name" {
  description = "The name of the firewall"
  type        = string
}
variable "vpc_regions" {
  description = "The regions in which the VPC will be created"
  type        = list(string)
}

# GKE variables
variable "gke_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "gke_count" {
  description = "The number of GKE clusters"
  type        = number
  default     = 1

}
variable "gke_location" {
  description = "The region in which the GKE cluster will be created"
  type        = string

}
variable "gke_node_count" {
  description = "The number of nodes in the GKE cluster"
  type        = number

}
variable "gke_service_account" {
  description = "The service account to use for the GKE cluster"
  type        = string

}
variable "gke_network" {
  description = "The network to use for the GKE cluster"
  type        = string

}
variable "gke_subnet" {
  description = "The subnet to use for the GKE cluster"
  type        = string

}
variable "gke_disk_size" {
  description = "The size of the disk for the GKE cluster"
  type        = number

}
variable "gke_disk_type" {
  description = "The type of the disk for the GKE cluster"
  type        = string

}
variable "gke_type_node" {
  description = "The type of the node for the GKE cluster"
  type        = string

}
variable "gke_deletion_protection" {
  description = "defines if the cluster will have deletion protection"
  type        = bool
}
variable "node_locations" {
  description = "The locations in which the nodes will be created"
  type        = list(string)
}
variable "project_id" {
  description = "The project id"
  type        = string
}
variable "auto_scaling_min_node_count" {
  description = "The minimum number of nodes in the GKE cluster"
  type        = number
}
variable "auto_scaling_max_node_count" {
  description = "The maximum number of nodes in the GKE cluster"
  type        = number
}

variable "project_number" {
  description = "The project number"
  type        = string
}
# SQL variables
variable "sql_instance_name" {
  description = "value of the SQL instance name"
  type        = string
}
variable "sql_instance_region" {
  description = "value of the SQL instance region"
  type        = string
}
variable "sql_instance_database_version" {
  description = "value of the SQL instance database version"
  type        = string
}

variable "sql_deletion_protection" {
  description = "value of the SQL instance deletion protection"
  type        = bool
  default     = false

}

variable "sql_disk_autoresize" {
  description = "value of the SQL instance disk autoresize"
  type        = bool
  default     = true
}

variable "sql_tier" {
  description = "value of the SQL instance tier"
  type        = string
  default     = "db-f1-micro"
}

variable "sql_private_network" {
  description = "value of the private network"
  type        = string
  default     = "default"

}

variable "sql_ip_public_enabled" {
  description = "value of the public IP enabled"
  type        = bool
  default     = false

}

#remote data
variable "backend_bucket" {
  description = "The name of the backend bucket"
  type        = string
}
variable "backend_prefix" {
  description = "The prefix for the backend"
  type        = string
}