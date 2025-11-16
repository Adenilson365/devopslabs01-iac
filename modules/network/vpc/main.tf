resource "google_compute_network" "this" {
  name                            = var.vpc_name
  project                         = var.project_id
  description                     = var.vpc_description
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  delete_default_routes_on_create = var.delete_default_routes_on_create
  mtu                             = var.mtu
  enable_ula_internal_ipv6        = var.enable_ula_internal_ipv6
}

resource "google_compute_shared_vpc_host_project" "host" {
  count      = var.enable_shared_vpc_host ? 1 : 0
  project    = var.project_id
  depends_on = [google_compute_network.this]
}

resource "google_compute_shared_vpc_service_project" "service" {
  for_each        = var.enable_shared_vpc_host ? toset(var.shared_vpc_service_projects) : []
  host_project    = var.project_id
  service_project = each.value
  depends_on      = [google_compute_shared_vpc_host_project.host]
}
