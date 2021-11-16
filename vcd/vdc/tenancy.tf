terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "~> 3.4.0"
    }
  }

  backend "s3" {
    bucket = "vcd-tenancies"
    key    = "${var.accountId}/tenancy.tfstate"
    region = "eu-west-2"
  }
}

variable "vcdHost" {
  type = string
}

variable "vcdUser" {
  type = string
}

variable "vcdPassword" {
  type = string
}

variable "defaultOrg" {
  type = string
}

provider "vcd" {
  user                 = var.vcdUser
  password             = var.vcdPassword
  auth_type            = "integrated"
  org                  = var.defaultOrg
  url                  = var.vcdHost
}

module "vdc" {
    source = "./modules/org-vdc"
}
