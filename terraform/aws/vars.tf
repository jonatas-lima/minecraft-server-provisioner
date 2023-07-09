variable "keypair_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Localização da chave ssh no sistema de arquivos"
}

variable "ami_config" {
  type    = string
  default = "ami-0f1bae6c3bedcc3b5"
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1"
}
