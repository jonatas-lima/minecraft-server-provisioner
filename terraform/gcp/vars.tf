variable "instance_name" {
  default     = "minecraft"
  type        = string
  description = "Minecraft instance name"
}

variable "flavor" {
  default     = "custom-2-4096"
  type        = string
  description = "Instance type"
}

variable "zone" {
  default     = "us-central1-f"
  type        = string
  description = "Zone where the instance will be created"
}

variable "image" {
  default     = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
  type        = string
  description = "Image which VM will be created"
}

variable "network_name" {
  default     = "minecraft-network"
  type        = string
  description = "Network name"
}

variable "keypair_path" {
  default     = "~/.ssh/id_rsa.pub"
  type        = string
  description = "Path to public SSH key"
}

variable "ssh_user" {
  default     = "ubuntu"
  type        = string
  description = "User to SSH"
}

variable "project" {
  type        = string
  description = "Project that the user is binded"
}