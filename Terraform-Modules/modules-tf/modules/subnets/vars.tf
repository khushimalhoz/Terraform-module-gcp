variable "prefix" {
  description = "Prefix for naming subnets (e.g., my-iac)"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, qa, prod)"
  type        = string
}

variable "network" {
  description = "The self-link of the VPC network."
  type        = string
}

variable "region" {
  description = "The region for the subnets."
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet configurations"
  type = list(object({
    cidr              = string
    region            = string
    description       = string
    secondary_ip_ranges = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
  }))
}

variable "private_subnets" {
  description = "List of private subnet configurations"
  type = list(object({
    cidr              = string
    region            = string
    description       = string
    secondary_ip_ranges = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
  }))
}
