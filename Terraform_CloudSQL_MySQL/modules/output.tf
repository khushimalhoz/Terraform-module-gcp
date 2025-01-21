output "cloudsql_instance" {
  description = "The names of the created CloudSQL instances"
  value       = module.cloudsql_instance.instance_name
}

output "cloudsql_instance_connection_name" {
  description = "The connection names of the created CloudSQL instances"
  value       = module.cloudsql_instance.instance_connection_name
}