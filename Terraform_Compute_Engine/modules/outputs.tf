output "instance_names" {
  description = "Names of the created instances"
  value       = module.compute_instance.instance_names
}

output "instance_ips" {
  description = "Public IPs of the created instances"
  value       = module.compute_instance.instance_ips
}
