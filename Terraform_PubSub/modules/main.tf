module "pubsub" {
  source     = "./pubsub"
  project_id = "my-gcp-project"
  region     = "us-central1"

  topic_count        = var.topic_count
  subscription_count = var.subscription_count
}
