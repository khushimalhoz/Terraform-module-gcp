variable "bucket_name" {
  description = "The name of the GCS bucket."
  type        = string
}

variable "location" {
  description = "The location of the GCS bucket. Example: US, ASIA, EUROPE."
  type        = string
}

variable "storage_class" {
  description = "The storage class of the GCS bucket. Example: STANDARD, NEARLINE, COLDLINE, ARCHIVE."
  type        = string
  default     = "STANDARD"
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket when deleting. Defaults to false."
  type        = bool
  default     = false
}

variable "versioning" {
  description = "Enable versioning on the bucket. Defaults to false."
  type        = bool
  default     = false
}

variable "logging_bucket" {
  description = "The bucket to store access logs. Leave empty for no logging."
  type        = string
  default     = ""
}

variable "logging_prefix" {
  description = "The prefix for logging objects in the logging bucket."
  type        = string
  default     = "logs/"
}

variable "lifecycle_rules" {
  description = "A list of lifecycle rules to apply to the bucket."
  type = list(object({
    action = object({
      type          = string
      storage_class = optional(string, null)
    })
    condition = object({
      age                        = optional(number, null)
      created_before             = optional(string, null)
      with_state                 = optional(string, null)
      matches_storage_class      = optional(list(string), null)
      num_newer_versions         = optional(number, null)
      custom_time_before         = optional(string, null)
      days_since_custom_time     = optional(number, null)
      days_since_noncurrent_time = optional(number, null)
      noncurrent_time_before     = optional(string, null)
    })
  }))
  default = []
}

variable "iam_bindings" {
  description = "A map of IAM bindings for the bucket. Example: { 'owner' = { role = 'roles/storage.admin', member = 'user:admin@example.com' } }"
  type = map(object({
    role   = string
    member = string
  }))
  default = {}
}

