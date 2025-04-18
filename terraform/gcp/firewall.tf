resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = google_compute_network.this.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "minecraft" {
  name    = "allow-minecraft"
  network = google_compute_network.this.name

  allow {
    protocol = "tcp"
    ports    = ["25565"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}
