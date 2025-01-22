output "cloud_scheduler_job_name" {
  description = "The name of the Cloud Scheduler job"
  value       = google_cloud_scheduler_job.job.name
}

output "job_name" {
  description = "The name of the Cloud Scheduler job"
  value       = google_cloud_scheduler_job.job.name
}

output "job_schedule" {
  description = "The schedule of the Cloud Scheduler job"
  value       = google_cloud_scheduler_job.job.schedule
}

output "job_time_zone" {
  description = "The time zone of the Cloud Scheduler job"
  value       = google_cloud_scheduler_job.job.time_zone
}

output "pubsub_topic" {
  description = "The Pub/Sub topic associated with the Cloud Scheduler job"
  value       = google_cloud_scheduler_job.job.pubsub_target[0].topic_name
}

output "job_description" {
  description = "The description of the Cloud Scheduler job"
  value       = google_cloud_scheduler_job.job.description
}
