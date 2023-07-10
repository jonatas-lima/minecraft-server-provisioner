resource "hcloud_ssh_key" "minecraft-server-key" {
  name       = "minecraft-server-key"
  public_key = file("${var.ssh_key_path}")
}
