output "pubsub_topics" {
  description = "The Pub/Sub topics created."
  value = [for topic in google_pubsub_topic.pubsub_topics : topic.name]
}

output "pubsub_subscriptions" {
  description = "The Pub/Sub subscriptions created."
  value = [for sub in google_pubsub_subscription.pubsub_subscriptions : sub.name]
}
