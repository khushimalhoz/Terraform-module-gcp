output "redis_cluster_id" {
  description = "The ID of the Redis cluster."
  value       = module.redis_ha.redis_cluster_id
}

output "redis_cluster_name" {
  description = "The name of the Redis cluster."
  value       = module.redis_ha.redis_cluster_name
}

output "redis_cluster_location" {
  description = "The location (region) of the Redis cluster."
  value       = module.redis_ha.redis_cluster_location
}

#output "redis_cluster_host" {
#  description = "The host of the Redis cluster."
#  value       = module.redis_ha.redis_cluster_host
#}

#output "redis_cluster_port" {
#  description = "The port of the Redis cluster."
#  value       = module.redis_ha.redis_cluster_port
#}

#output "network_id" {
#  description = "The ID of the network used for the Redis cluster."
#  value       = module.redis_ha.network_id
#}