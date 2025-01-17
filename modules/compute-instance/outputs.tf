output "instance_names" {
  description = "Names of the created instances"
  value       = google_compute_instance.vm_instance[*].name
}

output "instance_ips" {
  description = "Public IPs of the created instances"
  value       = google_compute_instance.vm_instance[*].network_interface[0].access_config[0].nat_ip
}
