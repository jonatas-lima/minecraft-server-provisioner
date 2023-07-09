resource "aws_instance" "minecraft_server" {
  launch_template {
    id = aws_launch_template.minecraft_server_template.id
  }

  tags = {
    "Name" = "minecraft server vm"
  }
}
