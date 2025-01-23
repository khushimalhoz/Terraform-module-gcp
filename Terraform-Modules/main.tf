# main.tf
module "vpc" {
  source      = "./modules/vpc"
  prefix      = var.prefix
  environment = var.environment
  #  name                         = var.vpc_name
  project_id                   = var.project_id
  auto_create_subnetworks      = var.auto_create_subnetworks
  description                  = var.vpc_description
  mtu                          = var.mtu
  enable_ula_internal_ipv6     = var.enable_ula_internal_ipv6
  routing_mode                 = var.routing_mode
  bgp_best_path_selection_mode = var.bgp_best_path_selection_mode
  bgp_always_compare_med       = var.bgp_always_compare_med
  bgp_inter_region_cost        = var.bgp_inter_region_cost
}

module "subnet" {
  source      = "./modules/subnets"
  prefix      = var.prefix
  environment = var.environment
  network     = module.vpc.self_link
  region      = var.region
  #  subnet_configs = var.subnet_configs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

}

module "firewall" {
  source         = "./modules/firewall"
  network        = module.vpc.self_link
  firewall_rules = var.firewall_rules
}



module "gcs_bucket" {
  source = "./modules/gcs_bucket"

  for_each       = { for b in var.buckets : b.bucket_name => b }
  bucket_name    = each.value.bucket_name
  location       = each.value.location
  storage_class  = each.value.storage_class
  force_destroy  = each.value.force_destroy
  versioning     = each.value.versioning
  logging_bucket = each.value.logging_bucket
  logging_prefix = each.value.logging_prefix
  lifecycle_rules = each.value.lifecycle_rules
  iam_bindings   = each.value.iam_bindings
}


locals {
  subnet_nat_configs = [
    for i, subnet in var.private_subnets : {
      name                    = "${var.prefix}-${var.environment}-private-subnet-${i + 1}"
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"] # Adjust as needed
    }
  ]
}


module "cloudnat" {
  source = "./modules/cloudnat"

  prefix                          = var.prefix
  environment                     = var.environment
  region                          = var.region
  network                         = module.vpc.self_link
  nat_ip_allocate_option          = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnet_nat_configs              = local.subnet_nat_configs
  private_subnet_links            = module.subnet.private_subnets
}




module "redis_instance" {
  source = "./modules/redis_instance" 
  redis_instances = var.redis_instances 
  #authorized_network         = module.vpc.self_link
}










