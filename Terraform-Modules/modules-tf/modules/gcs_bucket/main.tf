resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type = lifecycle_rule.value.action.type
      }
      condition {
        age = lifecycle_rule.value.condition.age
      }
    }
  }

  dynamic "logging" {
    for_each = var.logging_bucket != "" ? [1] : [] # Enable logging only if logging_bucket is set
    content {
      log_bucket        = var.logging_bucket
      log_object_prefix = var.logging_prefix
    }
  }
}

