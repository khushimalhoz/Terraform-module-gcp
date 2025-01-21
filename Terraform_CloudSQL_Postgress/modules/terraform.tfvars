project_id             = "alien-hour-447906-v0"
instance_name          = "postgres-instance-1"
database_version       = "POSTGRES_14"
region                 = "northamerica-south1"
zone                   = "northamerica-south1-a"
machine_type           = "db-f1-micro"
disk_size              = 20
enable_disk_autoresize = true
enable_public_ip       = true
require_ssl            = true
prevent_destroy        = false
deletion_protection    = false

databases = [
  {
    name      = "app_db"
    charset   = "UTF8"
    collation = "en_US.UTF8"
  }
]

users = [
  {
    name     = "app_user"
    password = "securepassword"
    host     = "%"
  }
]

