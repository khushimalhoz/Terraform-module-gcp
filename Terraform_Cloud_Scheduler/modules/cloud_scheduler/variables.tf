# modules/cloud_scheduler/variables.tf
variable "project_id" {
  description = "The name of the Cloud Scheduler job"
  type        = string
}

variable "region" {
  description = "The name of the Cloud Scheduler job"
  type        = string
}

variable "name" {
  description = "The name of the Cloud Scheduler job"
  type        = string
}

variable "description" {
  description = "The description of the Cloud Scheduler job"
  type        = string
}

variable "schedule" {
  description = "The schedule in cron format or App Engine cron format"
  type        = string
}

variable "time_zone" {
  description = "The time zone in which the job will run"
  type        = string
}

variable "attempt_deadline" {
  description = "The deadline for job attempts (e.g., '320s')"
  type        = string
}

variable "topic_name" {
  description = "The name of the Pub/Sub topic to which the job will publish"
  type        = string
}

variable "data" {
  description = "The data payload to send to the Pub/Sub topic"
  type        = string
}

variable "attributes" {
  description = "A map of attributes to send to the Pub/Sub topic"
  type        = map(string)
}
