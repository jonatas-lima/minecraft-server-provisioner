resource "aws_key_pair" "minecraft_server_keypair" {
  key_name   = "minecraft_server_keypair"
  public_key = file("${var.keypair_path}")
}
