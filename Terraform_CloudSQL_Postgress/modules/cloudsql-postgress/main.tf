resource "google_sql_database_instance" "cloudsql_instance" {
  name              = var.instance_name
  database_version  = var.database_version
  region            = var.region
  settings {
    tier            = var.machine_type
    disk_size       = var.disk_size
    disk_autoresize = var.enable_disk_autoresize
    ip_configuration {
      ipv4_enabled     = var.enable_public_ip
      # require_ssl      = var.require_ssl
    }
  }

  # lifecycle {
  #  prevent_destroy = var.prevent_destroy
  # }
    deletion_protection = var.deletion_protection
}

resource "google_sql_database" "databases" {
  count      = length(var.databases)
  name       = var.databases[count.index].name
  instance   = google_sql_database_instance.cloudsql_instance.name
  charset    = var.databases[count.index].charset
  collation  = var.databases[count.index].collation
}

resource "google_sql_user" "users" {
  count     = length(var.users)
  instance  = google_sql_database_instance.cloudsql_instance.name
  name      = var.users[count.index].name
  password  = var.users[count.index].password
}
