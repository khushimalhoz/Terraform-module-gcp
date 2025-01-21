module "redis" {
  source = "./redis"

  project_id         = var.project_id
  redis_clusters     = var.redis_clusters
  region             = var.region
  zone               = var.zone
  authorized_network = var.authorized_network
}
