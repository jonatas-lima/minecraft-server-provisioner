variable "keypair_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

# variable "flavor_id" {
#   type    = string
#   default = openstack_compute_flavor_v2.medium.id
# }

# variable "image_id" {
#   type    = string
#   default = openstack_images_image_ids_v2.image.ids
# }
