resource "mgc_virtual_machine_instances" "minecraft_server" {
  name                     = "minecraft-server"
  machine_type             = var.machine_type
  image                    = var.image
  ssh_key_name             = mgc_ssh_keys.minecraft_server_key.name
  allocate_public_ipv4     = true
  creation_security_groups = [mgc_network_security_groups.minecraft_sg.id]
}
