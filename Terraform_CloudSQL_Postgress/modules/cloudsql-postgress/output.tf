output "instance_name" {
  value = google_sql_database_instance.cloudsql_instance.name
}

output "instance_connection_name" {
  value = google_sql_database_instance.cloudsql_instance.connection_name
}
