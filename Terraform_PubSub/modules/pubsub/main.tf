resource "google_pubsub_topic" "pubsub_topics" {
  count = var.topic_count

  name = format("topic-%d", count.index + 1)
}

resource "google_pubsub_subscription" "pubsub_subscriptions" {
  count = var.subscription_count

  name  = format("sub-%d", count.index + 1)
  topic = google_pubsub_topic.pubsub_topics[count.index].id
}
