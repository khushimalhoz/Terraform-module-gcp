variable "redis_name" {
  description = "The name of the Redis instance."
  type        = string
}

variable "tier" {
  description = "The service tier of the Redis instance."
  type        = string
  default     = "STANDARD_HA"
}

variable "memory_size_gb" {
  description = "The memory size of the Redis instance in GB."
  type        = number
}

variable "location_id" {
  description = "The zone where the Redis instance resides."
  type        = string
}

variable "alternative_location_id" {
  description = "The alternative zone for the Redis instance in case of failover."
  type        = string
}

variable "authorized_network" {
  description = "The network to which the Redis instance is connected."
  type        = string
}

variable "redis_version" {
  description = "The version of Redis software."
  type        = string
  default     = "REDIS_4_0"
}

variable "display_name" {
  description = "An optional display name for the Redis instance."
  type        = string
}

variable "reserved_ip_range" {
  description = "The CIDR range of internal addresses reserved for the Redis instance."
  type        = string
}

variable "labels" {
  description = "A map of labels for the Redis instance."
  type        = map(string)
  default     = {}
}

variable "maintenance_day" {
  description = "The day for maintenance."
  type        = string
  default     = "TUESDAY"
}

variable "maintenance_time" {
  description = "The time for maintenance in HH:MM:SS format."
  type        = string
  default     = "00:30:00"
}

variable "persistence_mode" {
  description = "The persistence mode for the Redis instance."
  type        = string
  default     = "RDB"
}

variable "rdb_snapshot_period" {
  description = "The RDB snapshot period for persistence."
  type        = string
  default     = "TWELVE_HOURS"
}

variable "prevent_destroy" {
  description = "Whether to prevent destruction of the instance."
  type        = bool
  default     = false
}
