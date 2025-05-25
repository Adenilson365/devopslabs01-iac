resource "google_pubsub_topic" "subscription-labs01" {
  name    = var.topic_name
  project = var.project_id
}