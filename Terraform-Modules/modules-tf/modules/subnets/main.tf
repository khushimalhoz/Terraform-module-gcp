resource "google_compute_subnetwork" "public_subnet" {
  count                    = length(var.public_subnets)
  name                     = "${var.prefix}-${var.environment}-public-subnet-${count.index + 1}"
  ip_cidr_range            = var.public_subnets[count.index].cidr
  region                   = var.public_subnets[count.index].region
  network                  = var.network
  description              = var.public_subnets[count.index].description

  dynamic "secondary_ip_range" {
    for_each = var.public_subnets[count.index].secondary_ip_ranges != null ? var.public_subnets[count.index].secondary_ip_ranges : []
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
}

resource "google_compute_subnetwork" "private_subnet" {
  count                    = length(var.private_subnets)
  name                     = "${var.prefix}-${var.environment}-private-subnet-${count.index + 1}"
  ip_cidr_range            = var.private_subnets[count.index].cidr
  region                   = var.private_subnets[count.index].region
  network                  = var.network
  description              = var.private_subnets[count.index].description

  dynamic "secondary_ip_range" {
    for_each = var.private_subnets[count.index].secondary_ip_ranges != null ? var.private_subnets[count.index].secondary_ip_ranges : []
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
}

