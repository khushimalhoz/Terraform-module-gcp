resource "google_compute_instance" "vm_instance" {
  count        = var.instance_count
  name         = "${var.instance_name_prefix}-${count.index + 1}"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.vpc_network
    subnetwork = var.subnet
    access_config {
      # Ephemeral public IP
    }
  }

  metadata = var.metadata
}