resource "google_storage_bucket" "bucket" {
  name                        = random_pet.bucket_name_random.id
  location                    = var.bucket_location
  project                     = var.project_id
  uniform_bucket_level_access = true
}

