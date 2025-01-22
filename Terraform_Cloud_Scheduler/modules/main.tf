# root/main.tf
module "cloud_scheduler" {
  project_id       = var.project_id
  region           = var.region
  source           = "./cloud_scheduler"
  name             = var.name
  description      = var.description
  schedule         = var.schedule
  time_zone        = var.time_zone
  attempt_deadline = var.attempt_deadline
  topic_name       = var.topic_name
  data             = var.data
  attributes       = var.attributes
}

# output "cloud_scheduler_job_name" {
#  value = module.cloud_scheduler.job_name
#}
