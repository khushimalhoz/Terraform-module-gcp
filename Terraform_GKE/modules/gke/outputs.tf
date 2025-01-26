output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = google_container_cluster.gke_cluster.name
}

output "node_count" {
  description = "The number of nodes in the default node pool."
  value       = google_container_cluster.gke_cluster.initial_node_count
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster."
  value       = google_container_cluster.gke_cluster.endpoint
}

output "kubeconfig" {
  description = "Kubernetes configuration for accessing the cluster."
  value       = google_container_cluster.gke_cluster.master_auth[0].client_certificate
}
