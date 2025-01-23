project_id   = "alien-hour-447906-v0"
region       = "us-central1"
service_name = "my-cloudrun-service"
image        = "gcr.io/google-samples/hello-app:1.0"
env_variables = [
  {
    name  = "ENVIRONMENT"
    value = "production"
  }
]
annotations = {
  "run.googleapis.com/cloudsql-instances" = "alien-hour-447906-v0:us-central1:my-cloudrun-service"
}

allow_unauthenticated = true
invoker_roles         = ["khushi.malhotra@mygurukulam.co"]
