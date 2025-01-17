module "compute_instance" {
  source               = "./compute-instance"
  project_id           = var.project_id
  region               = var.region
  instance_count       = var.instance_count
  instance_name_prefix = var.instance_name_prefix
  machine_type         = var.machine_type
  zone                 = var.zone
  vpc_network          = var.vpc_network
  subnet               = var.subnet
  tags                 = var.tags
  image                = var.image
  metadata             = var.metadata
}
