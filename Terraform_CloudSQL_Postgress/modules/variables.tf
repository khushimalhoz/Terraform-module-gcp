variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "instance_name" {
  description = "Name of the CloudSQL instance"
  type        = string
}

variable "database_version" {
  description = "Database version"
  type        = string
}

variable "region" {
  description = "Region for the CloudSQL instance"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the CloudSQL instance"
  type        = string
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
}

variable "enable_disk_autoresize" {
  description = "Enable disk auto-resize"
  type        = bool
}

variable "enable_public_ip" {
  description = "Enable public IP"
  type        = bool
}

variable "require_ssl" {
  description = "Require SSL for connections"
  type        = bool
}

variable "prevent_destroy" {
  description = "Prevent destroy of the instance"
  type        = bool
}

variable "deletion_protection" {
  description = "Prevent destroy of the instance"
  type        = bool
}

variable "databases" {
  description = "Databases to create"
  type = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default = []
}

variable "users" {
  description = "Users to create"
  type = list(object({
    name     = string
    password = string
    host     = string
  }))
  default = []
}
