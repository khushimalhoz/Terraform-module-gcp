output "pubsub_topics" {
  description = "The Pub/Sub topics created."
  value       = module.pubsub.pubsub_topics
}

output "pubsub_subscriptions" {
  description = "The Pub/Sub subscriptions created."
  value       = module.pubsub.pubsub_subscriptions
}
