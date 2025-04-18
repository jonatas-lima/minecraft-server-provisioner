resource "google_compute_instance" "this" {
  name                      = var.instance_name
  machine_type              = var.flavor
  zone                      = var.zone
  allow_stopping_for_update = true
  metadata = {
    "ssh-keys" = <<EOT
      ${var.ssh_user}:${file(var.keypair_path)}
    EOT
  }

  network_interface {
    subnetwork = google_compute_subnetwork.this.id

    access_config {
      nat_ip = google_compute_address.external.address
    }
  }

  boot_disk {
    initialize_params {
      image = var.image
    }
  }
}
