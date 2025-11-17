output "subnet_id" {
  value = google_compute_subnetwork.vpc_subnet.id
}

output "subnet_name" {
  value = google_compute_subnetwork.vpc_subnet.name
}

output "subnet_self_link" {
  value = google_compute_subnetwork.vpc_subnet.self_link
}
