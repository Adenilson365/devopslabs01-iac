resource "google_sql_database" "database" {
  name = "database"
    instance = google_sql_database_instance.sql_instance.name

}

resource "google_sql_database_instance" "sql_instance" {
    name = var.sql_instance_name
    region = var.sql_instance_region
    database_version = var.sql_instance_database_version
    deletion_protection = var.sql_deletion_protection


    

    settings {
        tier = var.sql_tier
        disk_autoresize = var.sql_disk_autoresize 

    }

}