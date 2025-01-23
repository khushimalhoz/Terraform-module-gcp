resource "google_compute_router" "nat_router" {
  name    = "${var.prefix}-${var.environment}-nat-router"
  region  = var.region
  network = var.network
}

resource "google_compute_router_nat" "cloudnat" {
  name                               = "${var.prefix}-${var.environment}-cloudnat"
  region                             = var.region
  router                             = google_compute_router.nat_router.name
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  dynamic "subnetwork" {
    for_each = var.subnet_nat_configs
    content {
      name                    = subnetwork.value.name
      source_ip_ranges_to_nat = subnetwork.value.source_ip_ranges_to_nat
    }
  }
  depends_on = [
    # Use the private_subnet_links variable to enforce dependency
    var.private_subnet_links
  ]
}

