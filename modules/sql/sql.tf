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

    backup_configuration {
      enabled    = var.backup_enabled
      start_time = var.backup_start_time
      location   = var.sql_backup_region
      backup_retention_settings {
        retained_backups = var.retained_backups
        retention_unit   = var.retention_unit
      }
    }
  }
}

resource "google_sql_database_instance" "replica_instance" {
  name                 = "${var.sql_instance_name}-replica"
  region               = var.sql_instance_region
  database_version     = var.sql_instance_database_version
  master_instance_name = google_sql_database_instance.sql_instance.name

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