output "public_subnets" {
  value = google_compute_subnetwork.public_subnet[*].self_link
}

output "private_subnets" {
  value = google_compute_subnetwork.private_subnet[*].self_link
}

