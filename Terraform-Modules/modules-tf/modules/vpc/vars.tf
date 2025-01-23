variable "prefix" {
  description = "Prefix for naming resources (e.g., my-iac)"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, qa, prod)"
  type        = string
  # Change Based on environment
}

variable "project_id" {
  description = "The project ID where the VPC will be created."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "When set to true, subnetworks are created automatically."
  type        = bool
  default     = false
}

variable "description" {
  description = "An optional description of the VPC."
  type        = string
  default     = ""
}

variable "mtu" {
  description = "The Maximum Transmission Unit (MTU) for the VPC."
  type        = number
  default     = 1460
}

variable "enable_ula_internal_ipv6" {
  description = "Enable ULA internal IPv6 addressing for this VPC."
  type        = bool
  default     = false
}

variable "routing_mode" {
  description = "The network-wide routing mode to use. It can be REGIONAL or GLOBAL"
  type        = string
  default     = "GLOBAL"
}

variable "bgp_best_path_selection_mode" {
  description = "Custom BGP best path selection mode.It can be LEGACY or STANDARD"
  type        = string
  default     = "STANDARD"
}

variable "bgp_always_compare_med" {
  description = "Whether to always compare MED when determining the best path. Can be set only if bgp_best_path_selection_mode is STANDARD"
  type        = bool
  default     = true
}

variable "bgp_inter_region_cost" {
  description = "Inter-region cost for BGP routing. It can be ADD_COST_TO_MED or DEFAULT"
  type        = string
  default     = "DEFAULT"
}
