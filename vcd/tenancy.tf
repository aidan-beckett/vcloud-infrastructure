terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
    }
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
}