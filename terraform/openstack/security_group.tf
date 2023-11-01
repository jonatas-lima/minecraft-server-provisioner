resource "openstack_networking_secgroup_v2" "minecraft_sg" {
  name = "minecraft-sg"
 description = "All rules to access minecraft server"
}

resource "openstack_networking_secgroup_rule_v2" "ssh" {
  direction        = "ingress"
  ethertype        = "IPv4"
  protocol         = "tcp"
  port_range_min   = 22
  port_range_max   = 22
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.minecraft_sg.id
}

resource "openstack_networking_secgroup_rule_v2" "server_port" {
  direction        = "ingress"
  ethertype        = "IPv4"
  protocol         = "tcp"
  port_range_min   = 25565
  port_range_max   = 25565
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.minecraft_sg.id
}

resource "openstack_networking_secgroup_rule_v2" "ping" {
  direction        = "ingress"
  ethertype        = "IPv4"
  protocol         = "icmp"
  port_range_min   = 0
  port_range_max   = 0
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.minecraft_sg.id
}
