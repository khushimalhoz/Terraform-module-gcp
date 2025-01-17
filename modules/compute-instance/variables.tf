variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region for the instances"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
}

variable "instance_name_prefix" {
  description = "Prefix for instance names"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the instance"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the instance"
  type        = string
}

variable "vpc_network" {
  description = "The VPC network for the instance"
  type        = string
}

variable "subnet" {
  description = "The subnet for the instance"
  type        = string
}

variable "tags" {
  description = "Network tags for the instance"
  type        = list(string)
}

variable "image" {
  description = "The image for the boot disk"
  type        = string
}

variable "metadata" {
  description = "Metadata key/value pairs for the instance"
  type        = map(string)
}
