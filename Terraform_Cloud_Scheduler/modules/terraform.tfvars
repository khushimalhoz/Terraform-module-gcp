project_id       = "alien-hour-447906-v0"
region           = "us-central1"
name             = "cloud-scheduler-01"
description      = "This is a test Cloud Scheduler job"
schedule         = "*/5 * * * *"
time_zone        = "UTC"
attempt_deadline = "320s"
topic_name       = "projects/alien-hour-447906-v0/topics/cloud-scheduler-topic"
data             = "Hello, this is a Cloud Scheduler job!"

attributes = {
  job_id = "12345"
  source = "cloud-scheduler"
}
