
variable "firewall_name" {
  description = "The name of the firewall rule."
  type        = string
}

variable "vpc_network_id" {
  description = "The VPC network ID to associate with the firewall."
  type        = string
}

variable "protocol" {
  description = "The protocol to allow in the firewall rule."
  type        = string
}

variable "ports" {
  description = "The ports to allow for the specified protocol."
  type        = list(string)
}

variable "source_tags" {
  description = "The source tags for the firewall rule."
  type        = list(string)
  default     = []
}

variable "source_ranges" {
  description = "The source IP ranges for the firewall rule."
  type        = list(string)
  default     = []
}