resource "google_sql_database" "database" {
  name     = var.sql_database_name
  instance = google_sql_database_instance.sql_instance.name

}

resource "google_sql_database_instance" "sql_instance" {
  name                = var.sql_instance_name
  region              = var.sql_instance_region
  database_version    = var.sql_instance_database_version
  deletion_protection = var.sql_deletion_protection

  settings {
    tier            = var.sql_tier
    disk_autoresize = var.sql_disk_autoresize

    ip_configuration {
      ipv4_enabled                                  = var.sql_ip_public_enabled
      private_network                               = var.sql_private_network
      enable_private_path_for_google_cloud_services = true
    }
  }


}