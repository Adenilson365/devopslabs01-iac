variable "vpc_name" {
  description = "Name of the VPC network."
  type        = string
}

variable "project_id" {
  description = "Project where the VPC will be created."
  type        = string
}

variable "vpc_description" {
  description = "Optional description for the VPC."
  type        = string
  default     = ""
}

variable "auto_create_subnetworks" {
  description = "Whether to create the default subnetworks."
  type        = bool
  default     = false
}

variable "routing_mode" {
  description = "Routing mode for the VPC."
  type        = string
  default     = "REGIONAL"
}

variable "delete_default_routes_on_create" {
  description = "Delete default routes to allow custom routing."
  type        = bool
  default     = false
}

variable "mtu" {
  description = "MTU for the VPC."
  type        = number
  default     = 1460
}

variable "enable_ula_internal_ipv6" {
  description = "Enable Unique Local Address IPv6 range."
  type        = bool
  default     = false
}

variable "enable_shared_vpc_host" {
  description = "Enable the project as Shared VPC host."
  type        = bool
  default     = false
}

variable "shared_vpc_service_projects" {
  description = "List of service projects to attach when acting as Shared VPC host."
  type        = list(string)
  default     = []
}
