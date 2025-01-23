resource "google_compute_instance" "vm_instance" {
  for_each = { for idx, instance in var.instances : idx => instance }

  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone
  tags         = each.value.tags
  labels       = each.value.labels

  boot_disk {
    initialize_params {
      image = each.value.image
      size  = each.value.disk_size
      type  = each.value.disk_type
    }
  }

  network_interface {
    network    = each.value.network
    subnetwork = each.value.subnetwork

    # Use a dynamic block for conditional `access_config`
    dynamic "access_config" {
      for_each = each.value.public_ip ? [1] : []
      content {}
    }
  }

  service_account {
    email  = each.value.service_account_email
    scopes = each.value.service_account_scopes
  }

  metadata = each.value.metadata
}

