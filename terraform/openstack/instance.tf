resource "openstack_compute_instance_v2" "minecraft-server" {
  name            = "minecraft-server"
  image_id        = vars.image_id
  flavor_id       = vars.flavor_id
  key_pair        = openstack_compute_keypair_v2.minecraft-keypair.name
  security_groups = ["default", openstack_networking_secgroup_v2.minecraft_sg.name]

  network {
    
  }
}