resource "google_pubsub_topic" "pubsub_topics" {
  for_each = toset(var.topics)

  name = each.value
}

resource "google_pubsub_subscription" "pubsub_subscriptions" {
  for_each = var.subscriptions

  name  = each.key
  topic = google_pubsub_topic.pubsub_topics[each.value].id
}
