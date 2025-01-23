variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "region" {
  description = "Region for resources"
  type        = string
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "nat_ip_allocate_option" {
  description = "IP allocation option for Cloud NAT"
  type        = string
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "IP ranges to NAT"
  type        = string
}

variable "subnet_nat_configs" {
  description = "List of subnets and their NAT configuration"
  type        = list(object({
    name                    = string
    source_ip_ranges_to_nat = list(string)
  }))
}

variable "private_subnet_links" {
  description = "Self-links of private subnets from the subnets module"
  type        = list(string)
}
