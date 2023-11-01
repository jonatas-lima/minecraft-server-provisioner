variable "keypair_path" {
  type    = string
  default = "$HOME/.ssh/id_rsa.pub"
}

variable "flavor_id" {
  type    = string
  default = "general.medium"
}
