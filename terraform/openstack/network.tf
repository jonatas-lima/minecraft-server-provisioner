data "openstack_networking_network_v2" "network" {
  external = false
  status = "active"
}