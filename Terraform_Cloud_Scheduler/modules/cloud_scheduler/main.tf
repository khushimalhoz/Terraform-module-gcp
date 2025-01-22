# modules/cloud_scheduler/main.tf
resource "google_cloud_scheduler_job" "job" {
  name             = var.name
  description      = var.description
  schedule         = var.schedule
  time_zone        = var.time_zone
  attempt_deadline = var.attempt_deadline

  pubsub_target {
    topic_name = var.topic_name
    data       = base64encode(var.data)
    attributes = var.attributes
  }
}