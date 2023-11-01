resource "openstack_compute_keypair_v2" "minecraft-keypair" {
  name       = "minecraft-keypair"
  public_key = file("${var.keypair_path}")
}