# terraform.tfvars
project_id                  = "alien-hour-447906-v0"
region                      = "us-central1"
zone                        = "us-central1-a"
cluster_name                = "ha-cluster"
shard_count                 = 3
replica_count               = 1
node_type                   = "REDIS_SHARED_CORE_NANO"
network_id                  = "default"
subnetwork_id               = "default"
maxmemory_policy            = "volatile-ttl"
deletion_protection_enabled = false