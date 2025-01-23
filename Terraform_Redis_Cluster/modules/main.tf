module "redis_ha" {
  source                      = "./redis-cluster"
  cluster_name                = var.cluster_name
  shard_count                 = var.shard_count
  region                      = var.region
  replica_count               = var.replica_count
  node_type                   = var.node_type
  network_id                  = var.network_id
  subnetwork_id               = var.subnetwork_id
  maxmemory_policy            = var.maxmemory_policy
  deletion_protection_enabled = var.deletion_protection_enabled
  project_id                  = var.project_id
}