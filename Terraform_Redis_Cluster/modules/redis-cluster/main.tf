resource "google_redis_cluster" "redis-ha" {
  name           = var.cluster_name
  shard_count    = var.shard_count //shard count = no. of redis instances in your redis cluster
  region         = var.region
  replica_count  = var.replica_count //the number of replicas for each shard in your Redis cluster
  node_type      = var.node_type

  psc_configs {
    network    = "projects/${var.project_id}/global/networks/${var.network_id}"
  }

  redis_configs = {
    maxmemory-policy = var.maxmemory_policy
  }

  deletion_protection_enabled = var.deletion_protection_enabled

  zone_distribution_config {
    mode = "MULTI_ZONE"
  }
}