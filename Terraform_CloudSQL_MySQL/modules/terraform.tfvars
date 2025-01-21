project_id             = "alien-hour-447906-v0"
instance_name          = "my-cloudsql-instance"
database_version       = "MYSQL_8_0"
region                 = "northamerica-south1"
zone                   = "northamerica-south1-a"
machine_type           = "db-n1-standard-1"
disk_size              = 20
enable_disk_autoresize = true
enable_public_ip       = true
require_ssl            = true
prevent_destroy        = false
deletion_protection    = false

databases = [
  {
    name      = "app_db"
    charset   = "utf8"
    collation = "utf8_general_ci"
  }
]

users = [
  {
    name     = "app_user"
    password = "securepassword"
    host     = "%"
  }
]

