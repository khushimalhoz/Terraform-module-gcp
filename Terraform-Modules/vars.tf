variable "prefix" {
  description = "Prefix for naming resources (e.g., my-iac)"
  type        = string
  default     = "terraform-iac"
}

variable "environment" {
  description = "The environment (e.g., dev, qa, prod)"
  type        = string
  default     = "dev"
  # Change Based on environment
}

variable "region" {
  description = "Name of the region."
  type        = string
  default     = "northamerica-south1"
}

variable "project_id" {
  description = "GCP Project ID."
  type        = string
  default     = "alien-hour-447906-v0"
}

variable "auto_create_subnetworks" {
  description = "Auto-create subnetworks for the VPC."
  type        = bool
  default     = false
}

variable "vpc_description" {
  description = "Description of the VPC."
  type        = string
  default     = "my vpc created by terraform"
}

variable "mtu" {
  description = "MTU for the VPC."
  type        = number
  default     = 1460
}

variable "enable_ula_internal_ipv6" {
  description = "Enable ULA internal IPv6."
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


variable "firewall_rules" {
  description = "A map of firewall rules to create. Each rule must include name, direction, priority, allow_protocol, allow_ports, target_tags, source_tags, and source_ranges."
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
  default = {
    jenkins = {
      name           = "jenkins"
      direction      = "INGRESS"
      priority       = 1000
      allow_protocol = "tcp"
      allow_ports    = ["8080"]
      target_tags    = ["jenkins"]
      source_tags    = ["admin"]
      source_ranges  = ["0.0.0.0/0"]
    }
    sonarqube = {
      name           = "sonarqube"
      direction      = "INGRESS"
      priority       = 1000
      allow_protocol = "tcp"
      allow_ports    = ["9000"]
      target_tags    = ["sonarqube"]
      source_tags    = ["dev-team"]
      source_ranges  = ["0.0.0.0/0"]
    }
    prometheus_grafana = {
      name           = "prometheus-grafana"
      direction      = "INGRESS"
      priority       = 1000
      allow_protocol = "tcp"
      allow_ports    = ["9090", "3000"]
      target_tags    = ["prometheus", "grafana"]
      source_tags    = ["monitoring"]
      source_ranges  = ["10.0.0.0/8"]
    }
    egress_rule = {
      name           = "allow-egress"
      direction      = "EGRESS"
      priority       = 1000
      allow_protocol = "all"
      allow_ports    = []
      target_tags    = []
      source_tags    = []
      source_ranges  = ["0.0.0.0/0"]
    }
  }
}




variable "public_subnets" {
  description = "Public subnets configuration"
  type = list(object({
    cidr        = string
    region      = string
    description = string
    secondary_ip_ranges = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
  }))
  default = [
    {
      cidr        = "10.0.1.0/24"
      region      = "northamerica-south1"
      description = "Public subnet for web servers"
    },
    {
      cidr        = "10.0.2.0/24"
      region      = "northamerica-south1"
      description = "Public subnet for application servers"
    }
  ]
}

variable "private_subnets" {
  description = "Private subnets configuration"
  type = list(object({
    cidr        = string
    region      = string
    description = string
    secondary_ip_ranges = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
  }))
  default = [
    {
      cidr        = "10.0.3.0/24"
      region      = "northamerica-south1"
      description = "Private subnet for database servers"
      secondary_ip_ranges = [
        {
          range_name    = "secondary-db-range-1"
          ip_cidr_range = "192.168.1.0/24"
        }
      ]
    },
    {
      cidr        = "10.0.4.0/24"
      region      = "northamerica-south1"
      description = "Private subnet for caching servers"
      secondary_ip_ranges = [
        {
          range_name    = "secondary-cache-range-1"
          ip_cidr_range = "192.168.2.0/24"
        },
        {
          range_name    = "secondary-cache-range-2"
          ip_cidr_range = "192.168.3.0/24"
        }
      ]
    }
  ]
}



variable "buckets" {
  description = "A list of GCS bucket configurations."
  type = list(object({
    bucket_name     = string
    location        = string
    storage_class   = optional(string, "STANDARD")
    force_destroy   = optional(bool, false)
    versioning      = optional(bool, false)
    logging_bucket  = optional(string, "")
    logging_prefix  = optional(string, "logs/")
    lifecycle_rules = optional(list(object({
      action = object({
        type          = string
        storage_class = optional(string, null)
      })
      condition = object({
        age                        = optional(number, null)
        created_before             = optional(string, null)
        with_state                 = optional(string, null)
        matches_storage_class      = optional(list(string), null)
        num_newer_versions         = optional(number, null)
        custom_time_before         = optional(string, null)
        days_since_custom_time     = optional(number, null)
        days_since_noncurrent_time = optional(number, null)
        noncurrent_time_before     = optional(string, null)
      })
    })), [])
    iam_bindings = optional(map(object({
      role   = string
      member = string
    })), {})
  }))

 default = [
  {
    bucket_name     = "myfirst-bucket-terraform-today"
    location        = "US"
    storage_class   = "STANDARD"
    force_destroy   = true
    versioning      = true
    logging_bucket  = ""
    logging_prefix  = "logs/"
    lifecycle_rules = [
      {
        action = {
          type = "Delete"
        }
        condition = {
          age = 30
        }
      }
    ]
    iam_bindings = {
      "admin" = {
        role   = "roles/storage.admin"
        member = "user:sbalidkar@gmail.com"
      }
      "viewer" = {
        role   = "roles/storage.objectViewer"
        member = "serviceAccount:805417984039-compute@developer.gserviceaccount.com"
      }
    }
  },
  {
    bucket_name     = "public-bucket-terraform"
    location        = "US"
    storage_class   = "STANDARD"
    force_destroy   = true
    versioning      = false
    logging_bucket  = ""
    logging_prefix  = "logs/"
    lifecycle_rules = []
    iam_bindings = {
      "public-access" = {
        role   = "roles/storage.objectViewer"
        member = "allUsers"
      }
    }
  }
]

 
}


variable "nat_ip_allocate_option" {
  description = "IP allocation option for Cloud NAT"
  type        = string
  default     = "AUTO_ONLY" # Adjust based on your setup
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "IP ranges to NAT"
  type        = string
  default     = "LIST_OF_SUBNETWORKS" # Adjust based on your setup
}

#Redis instance variables

variable "redis_instances" {
  description = "List of Redis instances with configuration details"
  type = list(object({
    redis_instance_name        = string
    redis_instance_tier        = string
    redis_instance_memory_size_gb = number
    location_id                = string
    alternative_location_id    = optional(string)
    authorized_network         = string
    redis_version              = string
    display_name               = string
    reserved_ip_range          = string
    labels                     = map(string)
    maintenance_day            = string
    maintenance_time           = string
    persistence_mode           = string
    rdb_snapshot_period        = string
    prevent_destroy            = bool
  }))
  default = [
    {
      redis_instance_name        = "redis-instance-1"
      redis_instance_tier        = "STANDARD_HA"
      redis_instance_memory_size_gb = 4
      location_id                = "northamerica-south1-b"
      alternative_location_id    = "northamerica-south1-a"
      authorized_network         = "projects/alien-hour-447906-v0/global/networks/terraform-iac-dev-vpc" 
      redis_version              = "REDIS_7_0"
      display_name               = "Redis Instance 1"
      reserved_ip_range          = "10.0.0.0/24"
      labels                     = { "env" = "dev" }
      maintenance_day            = "SUNDAY"
      maintenance_time           = "03:00:00"
      persistence_mode           = "RDB"
      rdb_snapshot_period        = "TWENTY_FOUR_HOURS"
      prevent_destroy            = false
    },
    {
      redis_instance_name        = "redis-instance-2"
      redis_instance_tier        = "BASIC"
      redis_instance_memory_size_gb = 6
      location_id                = "northamerica-south1-a"
      #alternative_location_id    = "northamerica-south1-b"
      authorized_network         = "projects/alien-hour-447906-v0/global/networks/terraform-iac-dev-vpc"
      redis_version              = "REDIS_7_0"
      display_name               = "Redis Instance 2"
      reserved_ip_range          = "10.0.13.0/29"
      labels                     = { "env" = "prod" }
      maintenance_day            = "SATURDAY"
      maintenance_time           = "06:00:00"
      persistence_mode           = "DISABLED"
      rdb_snapshot_period        = "ONE_HOUR"
      prevent_destroy            = true
    }
  ]
}

