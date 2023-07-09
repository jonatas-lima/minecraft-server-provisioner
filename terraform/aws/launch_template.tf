resource "aws_launch_template" "minecraft_server_template" {
  name          = "minecraft_server_template"
  image_id      = var.ami_config
  instance_type = var.instance_type
  key_name      = aws_key_pair.minecraft_server_keypair.key_name

  monitoring {
    enabled = true
  }

  placement {
    availability_zone = var.availability_zone
  }

  network_interfaces {
    subnet_id                   = aws_subnet.minecraft_server_public_subnet.id
    associate_public_ip_address = true
    security_groups             = [aws_security_group.minecraft_server_sg.id]
  }

  tags = {
    "Name" = "minecraft server EC2 template"
  }
}
