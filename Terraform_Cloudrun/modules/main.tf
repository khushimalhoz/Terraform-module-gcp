module "cloudrun" {
  source                = "./cloudrun"
  service_name          = var.service_name
  region                = var.region
  image                 = var.image
  env_variables         = var.env_variables
  annotations           = var.annotations
  allow_unauthenticated = var.allow_unauthenticated
  invoker_roles         = var.invoker_roles
  project_id            = var.project_id
}
