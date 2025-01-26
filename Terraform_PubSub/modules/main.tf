module "pubsub" {
  source     = "./pubsub"
  project_id = "my-gcp-project"
  region     = "us-central1"

  topics = [
    "topic-1",
    "topic-2"
  ]

  subscriptions = {
    "sub-1" = "topic-1"
    "sub-2" = "topic-2"
  }
}
