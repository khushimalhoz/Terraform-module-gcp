output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = module.gke.cluster_name
}

output "node_count" {
  description = "The number of nodes in the default node pool."
  value       = module.gke.node_count
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster."
  value       = module.gke.cluster_endpoint
}

output "kubeconfig" {
  description = "Kubernetes configuration for accessing the cluster."
  value       = module.gke.kubeconfig
}
