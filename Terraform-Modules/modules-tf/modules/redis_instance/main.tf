resource "google_redis_instance" "redis_instance" {
  for_each = { for idx, redis_instance in var.redis_instances : idx => redis_instance }

  name           = each.value.redis_instance_name
  tier           = each.value.redis_instance_tier
  memory_size_gb = each.value.redis_instance_memory_size_gb

  location_id             = each.value.location_id
  alternative_location_id = each.value.alternative_location_id

  authorized_network = each.value.authorized_network

  redis_version     = each.value.redis_version
  display_name      = each.value.display_name
  reserved_ip_range = each.value.reserved_ip_range

  labels = each.value.labels

  maintenance_policy {
    weekly_maintenance_window {
      day = each.value.maintenance_day
      start_time {
        hours   = tonumber(split(":", each.value.maintenance_time)[0])
        minutes = tonumber(split(":", each.value.maintenance_time)[1])
        seconds = tonumber(split(":", each.value.maintenance_time)[2])
      }
    }
  }

  persistence_config {
    persistence_mode     = each.value.persistence_mode
    rdb_snapshot_period = each.value.rdb_snapshot_period
  }

  lifecycle {
    prevent_destroy = false
  }
}
