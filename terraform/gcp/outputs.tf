output "instance_public_ip" {
  value = google_compute_address.external.address
}