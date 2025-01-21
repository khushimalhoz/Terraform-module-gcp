variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "redis_clusters" {
  description = "Configuration for Redis clusters"
  type = map(object({
    name           = string
    memory_size_gb = number
    tier           = string
  }))
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the instance"
  type        = string
}

variable "authorized_network" {
  description = "VPC network for Redis clusters"
  type        = string
}