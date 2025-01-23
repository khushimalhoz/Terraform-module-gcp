resource "google_compute_firewall" "firewall" {
  for_each = var.firewall_rules

  name          = each.value.name
  network       = var.network
  direction     = each.value.direction
  priority      = each.value.priority
  allow {
    protocol = each.value.allow_protocol
    ports    = each.value.allow_ports
  }
  target_tags   = each.value.target_tags
  source_tags   = each.value.source_tags
  source_ranges = each.value.source_ranges
}

