resource "google_compute_network" "vpc" {
  name                    = "${var.prefix}-${var.environment}-vpc"
# name                    = var.name
  project                 = var.project_id
  auto_create_subnetworks = var.auto_create_subnetworks
  description             = var.description
  mtu                     = var.mtu
  enable_ula_internal_ipv6 = var.enable_ula_internal_ipv6
  provider                                  = google-beta
  routing_mode                 = var.routing_mode
  bgp_best_path_selection_mode = var.bgp_best_path_selection_mode
  bgp_always_compare_med       = var.bgp_always_compare_med
  bgp_inter_region_cost        = var.bgp_inter_region_cost
}
