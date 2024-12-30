output "stack_subnet" {
  value = module.network-gcp.subnet_id[*].us-east1.id
}

output "module_vpc_name" {
  value = module.network-gcp.vpc_name
}

output "module_gke_name" {
  value = module.gke.gke_name_output
}

output "module_sql_instance_ip" {
  value = module.sql.ip_address
}
