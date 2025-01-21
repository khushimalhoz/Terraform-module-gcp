module "serverless_vpc_connector" {
  source        = "./vpc-connector"
  project_id    = var.project_id
  name          = var.connector_name
  region        = var.region
  zone          = var.zone
  network       = var.network
  ip_cidr_range = var.ip_cidr_range
  min_instances = var.min_instances
  max_instances = var.max_instances    
  labels = var.labels
}

output "vpc_connector_name" {
  value = module.serverless_vpc_connector.connector_name
}
