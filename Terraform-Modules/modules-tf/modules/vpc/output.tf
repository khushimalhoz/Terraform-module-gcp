output "id" {
  description = "An identifier for the resource."
  value       = google_compute_network.vpc.id
}

output "self_link" {
  description = "The self-link of the VPC network."
  value       = google_compute_network.vpc.self_link
}

output "gateway_ipv4" {
  description = "The gateway address for default routing out of the network."
  value       = google_compute_network.vpc.gateway_ipv4
}

output "network_id" {
  description = "The unique identifier for the resource."
  value       = google_compute_network.vpc.network_id
}
