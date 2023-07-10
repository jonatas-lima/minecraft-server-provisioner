variable "location" {
  type    = string
  default = "ash"
}

variable "server_type" {
  type    = string
  default = "cpx21"
}

variable "ssh_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
