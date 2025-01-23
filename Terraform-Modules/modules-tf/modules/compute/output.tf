output "instance_names" {
  value = google_compute_instance.instance[*].name
}

output "instance_self_links" {
  value = google_compute_instance.instance[*].self_link
}

output "instance_network_interfaces" {
  value = google_compute_instance.instance[*].network_interface
}
