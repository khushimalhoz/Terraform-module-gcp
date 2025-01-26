variable "project_id" {
  description = "The ID of the GCP project where the resources will be created."
  type        = string
}

variable "region" {
  description = "The region where resources will be created."
  type        = string
}

variable "topic_count" {
  description = "The number of Pub/Sub topics to create."
  type        = number
}

variable "subscription_count" {
  description = "The number of Pub/Sub subscriptions to create."
  type        = number
}

