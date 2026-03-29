variable "region" {
  type        = string
  default     = "br-ne1"
  description = "Magalu Cloud region"
}

variable "machine_type" {
  type        = string
  default     = "BV2-4-10"
  description = "Machine type: 2 vCPU, 4 GB RAM, 10 GB disk"
}

variable "image" {
  type        = string
  default     = "cloud-ubuntu-24.04 LTS"
  description = "OS image name"
}

variable "ssh_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to the local public SSH key file"
}
