resource "mgc_ssh_keys" "minecraft_server_key" {
  name = "minecraft-server-key"
  key  = file(var.ssh_key_path)
}
