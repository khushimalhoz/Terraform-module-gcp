output "connector_name" {
  description = "Name of the created Serverless VPC Connector"
  value       = google_vpc_access_connector.this.name
}
