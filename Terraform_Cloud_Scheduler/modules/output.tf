output "cloud_scheduler_job_name" {
  description = "The name of the Cloud Scheduler job created"
  value       = module.cloud_scheduler.job_name
}

output "cloud_scheduler_schedule" {
  description = "The schedule of the Cloud Scheduler job"
  value       = module.cloud_scheduler.job_schedule
}

output "cloud_scheduler_time_zone" {
  description = "The time zone of the Cloud Scheduler job"
  value       = module.cloud_scheduler.job_time_zone
}

output "cloud_scheduler_pubsub_topic" {
  description = "The Pub/Sub topic associated with the Cloud Scheduler job"
  value       = module.cloud_scheduler.pubsub_topic
}

output "cloud_scheduler_description" {
  description = "The description of the Cloud Scheduler job"
  value       = module.cloud_scheduler.job_description
}
