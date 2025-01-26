variable "project_id" {
  description = "The project ID where the GKE cluster will be created."
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster will be created."
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
}

variable "machine_type" {
  description = "The machine type for the nodes."
  type        = string
}

variable "disk_type" {
  description = "The disk_type."
  type        = string
}

variable "disk_size_gb" {
  description = "The disk_size_gb"
  type        = number
}
