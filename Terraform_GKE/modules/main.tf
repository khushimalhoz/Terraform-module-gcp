module "gke" {
  source       = "./gke"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
  node_count   = var.node_count
  machine_type = var.machine_type
  disk_type    = var.disk_type
  disk_size_gb = var.disk_size_gb

}