resource "google_redis_instance" "redis_instance" {
  name           = var.redis_name
  tier           = var.tier
  memory_size_gb = var.memory_size_gb

  location_id             = var.location_id
  alternative_location_id = var.alternative_location_id

  authorized_network = var.authorized_network

  redis_version     = var.redis_version
  display_name      = var.display_name
  reserved_ip_range = var.reserved_ip_range

  labels = var.labels

  maintenance_policy {
    weekly_maintenance_window {
      day = var.maintenance_day
      start_time {
        hours   = tonumber(split(":", var.maintenance_time)[0])
        minutes = tonumber(split(":", var.maintenance_time)[1])
        seconds = tonumber(split(":", var.maintenance_time)[2])
      }
    }
  }

  persistence_config {
    persistence_mode     = var.persistence_mode
    rdb_snapshot_period = var.rdb_snapshot_period
  }

  lifecycle {
    prevent_destroy = false
  }
}

