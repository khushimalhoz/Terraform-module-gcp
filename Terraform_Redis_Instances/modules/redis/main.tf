resource "google_redis_instance" "redis" {
  for_each = var.redis_clusters

  name               = each.value.name
  memory_size_gb     = each.value.memory_size_gb
  tier               = each.value.tier
  region             = var.region
  authorized_network = var.authorized_network
}
