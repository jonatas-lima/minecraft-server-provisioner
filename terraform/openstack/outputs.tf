output "vm_public_ip" {
    value = openstack_compute_instance_v2.minecraft-server.access_ip_v4
}