variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "name" {
  description = "Name of the Serverless VPC Connector"
  type        = string
}

variable "region" {
  description = "Region where the VPC connector will be created"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the instance"
  type        = string
}

variable "network" {
  description = "VPC network to associate with the Serverless VPC Connector"
  type        = string
}

variable "ip_cidr_range" {
  description = "CIDR range for the VPC connector (e.g., 10.8.0.0/28)"
  type        = string
}

variable "min_instances" {
  description = "Maximum throughput in Mbps for the connector (optional, specify either max_throughput or max_instances)"
  type        = number
}

variable "max_instances" {
  description = "Maximum number of instances for the connector (optional, specify either max_throughput or max_instances)"
  type        = number
}

variable "labels" {
  description = "Labels to apply to the VPC connector"
  type        = map(string)
  default     = {}
}
