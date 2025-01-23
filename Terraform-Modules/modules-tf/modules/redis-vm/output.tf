output "redis_instance_name" {
  description = "The name of the Redis instance."
  value       = google_redis_instance.redis_instance.name
}

output "redis_instance_host" {
  description = "The host of the Redis instance."
  value       = google_redis_instance.redis_instance.host
}

output "redis_instance_port" {
  description = "The port of the Redis instance."
  value       = google_redis_instance.redis_instance.port
}

output "redis_instance_memory_size_gb" {
  description = "The memory size of the Redis instance in GB."
  value       = google_redis_instance.redis_instance.memory_size_gb
}

output "redis_instance_tier" {
  description = "The tier of the Redis instance."
  value       = google_redis_instance.redis_instance.tier
}

output "authorized_network_input" {
  value = var.authorized_network
}
