variable "vpc_network_id" {
  description = "The VPC network to create subnets in."
  type        = any
}

variable "vpc_region" {
  description = "Region where the subnet will be created."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "ip_cidr_range" {
  description = "The IP CIDR range for the subnet. Example: 10.0.0.0/24"
  type        = string
}

variable "enable_secondary_ranges" {
  description = "Whether secondary IP ranges should be created (used for GKE)."
  type        = bool
  default     = false
}

variable "pods_secondary_ip_range_name" {
  description = "Name of the secondary range for GKE Pods."
  type        = string
  default     = null
}

variable "pods_secondary_ip_cidr_range" {
  description = "CIDR of the secondary range for GKE Pods."
  type        = string
  default     = null
}

variable "services_secondary_ip_range_name" {
  description = "Name of the secondary range for GKE Services."
  type        = string
  default     = null
}

variable "services_secondary_ip_cidr_range" {
  description = "CIDR of the secondary range for GKE Services."
  type        = string
  default     = null
}
