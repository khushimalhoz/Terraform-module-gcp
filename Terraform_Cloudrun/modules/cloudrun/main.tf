resource "google_cloud_run_service" "cloudrun" {
  name     = var.service_name
  location = var.region

  template {
    metadata {
      annotations = var.annotations
    }

    spec {
      containers {
        image = var.image

        dynamic "env" {
          for_each = var.env_variables
          content {
            name  = env.value.name
            value = env.value.value
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_project_iam_member" "cloudrun_invoker" {
  for_each = toset(var.allow_unauthenticated ? ["allUsers"] : var.invoker_roles)
  project  = var.project_id
  role     = "roles/run.invoker"
  member   = each.key
}
