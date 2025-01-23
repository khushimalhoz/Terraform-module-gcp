variable "redis_instances" {
  description = "List of Redis instances with configuration details"
  type = list(object({
    redis_instance_name        = string
    redis_instance_tier        = string
    redis_instance_memory_size_gb = number
    location_id                = string
    alternative_location_id    = string
    authorized_network         = string
    redis_version              = string
    display_name               = string
    reserved_ip_range          = string
    labels                     = map(string)
    maintenance_day            = string
    maintenance_time           = string
    persistence_mode           = string
    rdb_snapshot_period        = string
    prevent_destroy            = bool
  }))
  default = []
}
