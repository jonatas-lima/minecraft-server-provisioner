resource "hcloud_server" "minecraft-server" {
  name        = "minecraft-server"
  image       = "ubuntu-22.04"
  server_type = var.server_type
  location    = var.location

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  firewall_ids = [hcloud_firewall.minecraft-server-fw.id]
  ssh_keys     = [hcloud_ssh_key.minecraft-server-key.id]
}
