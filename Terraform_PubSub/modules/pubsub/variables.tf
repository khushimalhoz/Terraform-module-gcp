variable "project_id" {
  description = "The ID of the GCP project where the resources will be created."
  type        = string
}

variable "region" {
  description = "The region where resources will be created."
  type        = string
}

variable "topics" {
  description = "List of Pub/Sub topics to be created."
  type        = list(string)
}

variable "subscriptions" {
  description = "Map of subscriptions to topics. Each key is the subscription name, and the value is the topic name."
  type = map(string)
}
