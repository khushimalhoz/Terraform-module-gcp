project_id           = "alien-hour-447906-v0"
region               = "northamerica-south1"
instance_count       = 2
instance_name_prefix = "my-instance"
machine_type         = "e2-micro"
zone                 = "northamerica-south1-a"
vpc_network          = "terraform-iac-dev-vpc"
subnet               = "terraform-iac-dev-public-subnet-1"
tags                 = ["web", "app"]
image                = "projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2004-focal-v20250107"
metadata             = {}
