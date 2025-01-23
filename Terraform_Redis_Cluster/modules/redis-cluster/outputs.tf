# outputs.tf

output "redis_cluster_id" {
  description = "The ID of the Redis cluster."
  value       = google_redis_cluster.redis-ha.id
}

output "redis_cluster_name" {
  description = "The name of the Redis cluster."
  value       = google_redis_cluster.redis-ha.name
}

output "redis_cluster_location" {
  description = "The location (region) of the Redis cluster."
  value       = google_redis_cluster.redis-ha.region
}

#output "redis_cluster_host" {
#  description = "The host of the Redis cluster."
#  value       = google_redis_cluster.redis-ha.host
#}

#output "redis_cluster_port" {
#  description = "The port of the Redis cluster."
#  value       = google_redis_cluster.redis-ha.port
#}

#output "network_id" {
#  description = "The ID of the network used for the Redis cluster."
#  value       = google_compute_network.producer_net.id
#}