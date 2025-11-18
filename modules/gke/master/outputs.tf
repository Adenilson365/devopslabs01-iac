output "gke_name_output" {
  value = google_container_cluster.primary.name

}

output "gke_cluster_id" {
  value = google_container_cluster.primary.id
}