data "openstack_compute_flavor_v2" "medium" {
  vcpus   = 2
  min_ram = 4096
}