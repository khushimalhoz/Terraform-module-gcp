variable "project_id" {
  description = "The name of the Redis cluster."
  type        = string
}

variable "zone" {
  description = "The name of the Redis cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the Redis cluster."
  type        = string
}

variable "shard_count" {
  description = "The number of shards in the Redis cluster."
  type        = number
  default     = 3
}

variable "region" {
  description = "The region where the Redis cluster will be created."
  type        = string
  default     = "us-central1"
}

variable "replica_count" {
  description = "The number of replicas per shard."
  type        = number
  default     = 1
}

variable "node_type" {
  description = "The type of Redis node."
  type        = string
  default     = "REDIS_SHARED_CORE_NANO"
}

variable "network_id" {
  description = "The ID of the network for the Redis cluster."
  type        = string
}

variable "subnetwork_id" {
  description = "The ID of the network for the Redis cluster."
  type        = string
}

variable "maxmemory_policy" {
  description = "The maxmemory policy for Redis."
  type        = string
  default     = "volatile-ttl"
}

variable "deletion_protection_enabled" {
  description = "Whether deletion protection is enabled."
  type        = bool
  default     = true
}