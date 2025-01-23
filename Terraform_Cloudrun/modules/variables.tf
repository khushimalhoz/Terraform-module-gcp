variable "project_id" {
  description = "The project ID where the Cloud Run service will be created"
  type        = string
}

variable "region" {
  description = "The region where the Cloud Run service will be deployed"
  type        = string
  default     = "us-central1"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "image" {
  description = "The container image to deploy"
  type        = string
}

variable "env_variables" {
  description = "Environment variables for the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "annotations" {
  description = "Annotations for the Cloud Run service"
  type        = map(string)
  default     = {}
}

variable "metadata" {
  description = "Annotations for the Cloud Run service"
  type        = map(string)
  default     = {}
}

variable "allow_unauthenticated" {
  description = "Whether to allow unauthenticated access"
  type        = bool
  default     = true
}

variable "invoker_roles" {
  description = "IAM roles for invoking the service"
  type        = list(string)
  default     = []
}
