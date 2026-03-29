locals {
  sg_rules = {
    ssh = {
      description    = "Allow SSH"
      protocol       = "tcp"
      port_range_min = 22
      port_range_max = 22
    }
    minecraft_port = {
      description    = "Allow Minecraft Java Edition"
      protocol       = "tcp"
      port_range_min = 25565
      port_range_max = 25565
    }
    icmp = {
      description    = "Allow ICMP (ping)"
      protocol       = "icmp"
      port_range_min = null
      port_range_max = null
    }
  }
}

resource "mgc_network_security_groups" "minecraft_sg" {
  name        = "minecraft-sg"
  description = "Security group for Minecraft server"
}

resource "mgc_network_security_groups_rules" "this" {
  for_each = local.sg_rules

  description       = each.value.description
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = each.value.protocol
  port_range_min    = each.value.port_range_min
  port_range_max    = each.value.port_range_max
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.minecraft_sg.id
}
