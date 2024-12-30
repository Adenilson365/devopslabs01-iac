variable "sql_instance_name" {
  description = "value of the SQL instance name"
    type = string
}
variable "sql_intance_region" {
  description = "value of the SQL instance region"
    type = string
}
variable "sql_instance_database_version" {
  description = "value of the SQL instance database version"
    type = string
}

variable "sql_deletion_protection" {
  description = "value of the SQL instance deletion protection"
    type = bool
    default = false
  
}

variable "sql_disk_autoresize" {
  description = "value of the SQL instance disk autoresize"
    type = bool
    default = true
}

variable "sql_tier" {
  description = "value of the SQL instance tier"
    type = string
    default = "db-f1-micro"
}
variable "sql_instance_region" {
  description = "value of the SQL instance region"
    type = string
  
}
