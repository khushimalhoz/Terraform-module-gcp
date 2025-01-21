variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "redis_clusters" {
  description = "List of Redis cluster configurations"
  type = map(object({
    name           = string
    memory_size_gb = number
    tier           = string
  }))
}

variable "region" {
  description = "GCP region for Redis clusters"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the instance"
  type        = string
}

variable "authorized_network" {
  description = "Authorized network for Redis clusters"
  type        = string
}
