resource "google_pubsub_topic" "subscription-labs01" {
  name = "subscription-labs01"
  project = var.project_id
}