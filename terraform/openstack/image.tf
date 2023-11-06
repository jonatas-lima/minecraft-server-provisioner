data "openstack_images_image_ids_v2" "image" {
  name_regex = "^ubuntu-22.*"
  sort       = "updated_at"
}