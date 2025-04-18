resource "google_compute_network" "this" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name          = "${var.network_name}-subnet"
  ip_cidr_range = "10.0.0.0/16"
  network       = google_compute_network.this.id
}

resource "google_compute_address" "external" {
  name = "external-ip"
}
