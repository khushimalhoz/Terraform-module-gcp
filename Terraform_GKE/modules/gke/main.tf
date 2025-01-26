resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.region

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    
    ]
    disk_type = var.disk_type
    disk_size_gb = var.disk_size_gb
  }

  initial_node_count = var.node_count

  deletion_protection = false
}

