project_id         = "alien-hour-447906-v0"
region             = "northamerica-south1"
authorized_network = "default"
zone               = "northamerica-south1-a"

redis_clusters = {
  redis-cluster-1 = {
    name           = "redis-cluster-1"
    memory_size_gb = 4
    tier           = "STANDARD_HA"
  },
  redis-cluster-2 = {
    name           = "redis-cluster-2"
    memory_size_gb = 2
    tier           = "BASIC"
  }
}
