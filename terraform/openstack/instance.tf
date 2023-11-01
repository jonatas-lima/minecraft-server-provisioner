resource "openstack_compute_instance_v2" "minecraft-server" {
  name      = "minecraft-server"
  flavor_id  = vars.flavor_id
  key_pair  = openstack_compute_keypair_v2.minecraft-keypair.name
}