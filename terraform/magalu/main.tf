terraform {
  required_providers {
    mgc = {
      source  = "magalucloud/mgc"
      version = "~> 0.45"
    }
  }
}

variable "api_key" {
  type        = string
  description = "Magalu Cloud API Key"
  sensitive   = true
}

provider "mgc" {
  api_key = var.api_key
  region  = var.region
}
