output "pubsub_topics" {
  description = "The Pub/Sub topics created."
  value = values(google_pubsub_topic.pubsub_topics)[*].name
}

output "pubsub_subscriptions" {
  description = "The Pub/Sub subscriptions created."
  value = values(google_pubsub_subscription.pubsub_subscriptions)[*].name
}
