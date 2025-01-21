module "cloudsql_instance" {
  source                 = "./cloudsql-postgress"
  project_id             = var.project_id
  instance_name          = var.instance_name
  database_version       = var.database_version
  region                 = var.region
  zone                   = var.zone
  machine_type           = var.machine_type
  disk_size              = var.disk_size
  enable_disk_autoresize = var.enable_disk_autoresize
  enable_public_ip       = var.enable_public_ip
  require_ssl            = var.require_ssl
  prevent_destroy        = var.prevent_destroy
  deletion_protection    = var.deletion_protection
  databases              = var.databases
  users                  = var.users
}
