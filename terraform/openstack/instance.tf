resource "openstack_compute_instance_v2" "minecraft-server" {
  name            = "minecraft-server"
  image_id        = tolist(data.openstack_images_image_ids_v2.image.ids)[0]
  flavor_id       = data.openstack_compute_flavor_v2.medium.id
  key_pair        = openstack_compute_keypair_v2.minecraft-keypair.name
  security_groups = ["default", openstack_networking_secgroup_v2.minecraft_sg.name]

  network {
    name = "provider"
  }
}