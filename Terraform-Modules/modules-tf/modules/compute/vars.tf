variable "instances" {
  description = "List of maps describing the Compute Engine instances to create"
  type = list(object({
    name                  = string
    machine_type          = string
    zone                  = string
    image                 = string
    disk_size             = number
    disk_type             = string
    network               = string
    subnetwork            = string
    tags                  = list(string)
    metadata              = map(string)
    labels                = map(string)
    service_account_email = string
    service_account_scopes = list(string)
  }))
}
