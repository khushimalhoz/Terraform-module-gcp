variable "network" {
  description = "The self-link of the network to attach firewall rules."
  type        = string
}

variable "firewall_rules" {
  description = "A map of firewall rules to create."
  type = map(object({
    name           = string
    direction      = string
    priority       = number
    allow_protocol = string
    allow_ports    = list(string)
    target_tags    = list(string)
    source_tags    = list(string)
    source_ranges  = list(string)
  }))
}

