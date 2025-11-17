output "id" {
  value = google_compute_network.this.id
}

output "self_link" {
  value = google_compute_network.this.self_link
}

output "vpc_name" {
  value = google_compute_network.this.name
}

output "gateway_ipv4" {
  value = google_compute_network.this.gateway_ipv4
}

output "routing_mode" {
  value = google_compute_network.this.routing_mode
}

output "auto_create_subnetworks" {
  value = google_compute_network.this.auto_create_subnetworks
}

output "shared_vpc_host_enabled" {
  value = var.enable_shared_vpc_host
}
