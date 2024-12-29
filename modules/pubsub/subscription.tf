resource "google_pubsub_subscription" "subscription-labs01" {
  name  = var.subscription_name
  topic = google_pubsub_topic.subscription-labs01.name
  project = var.project_id
  ack_deadline_seconds = 10
  message_retention_duration = "604800s"
  expiration_policy {
    ttl = "2678400s"
  }

  retry_policy {
    minimum_backoff = "10s"
    maximum_backoff = "600s"
  }
  cloud_storage_config {
    bucket = var.storage_bucket
    filename_prefix = "subs-"
service_account_email = "terraform-linux-sa@devopslabs-442223.iam.gserviceaccount.com"
  }
  depends_on = [ google_pubsub_topic.subscription-labs01 ]
}