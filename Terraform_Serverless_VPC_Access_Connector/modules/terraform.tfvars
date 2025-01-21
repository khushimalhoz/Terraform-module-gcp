project_id     = "alien-hour-447906-v0"
region         = "northamerica-south1"
zone           = "northamerica-south1-a"
connector_name = "serverless-vpc-connector"
network        = "default"
ip_cidr_range  = "10.8.0.0/28"
min_instances  = 2
max_instances  = 3
labels = {
  environment = "staging"
  team        = "devops"
}