output "bucket_name" {
  description = "Name of the bucket"
  value       = google_storage_bucket.bucket.name
}

output "bucket_self_link" {
  description = "Self-link of the bucket"
  value       = google_storage_bucket.bucket.self_link
}

output "bucket_url" {
  description = "Public URL of the bucket"
  value       = google_storage_bucket.bucket.url
}
