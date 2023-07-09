resource "aws_vpc" "minecraft_server_vpc" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "minecraft_server_vpc"
  }
}

resource "aws_subnet" "minecraft_server_public_subnet" {
  vpc_id                  = aws_vpc.minecraft_server_vpc.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "minecraft_server_public_subnet"
  }
}

resource "aws_internet_gateway" "minecraft_server_igw" {
  vpc_id = aws_vpc.minecraft_server_vpc.id

  tags = {
    Name = "minecraft_server_igw"
  }
}

resource "aws_route_table" "minecraft_server_rt" {
  vpc_id = aws_vpc.minecraft_server_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.minecraft_server_igw.id
  }

  tags = {
    Name = "minecraft_server_rt"
  }
}

resource "aws_route_table_association" "minecraft_server_1a" {
  subnet_id      = aws_subnet.minecraft_server_public_subnet.id
  route_table_id = aws_route_table.minecraft_server_rt.id
}
