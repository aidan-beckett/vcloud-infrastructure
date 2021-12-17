terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "~> 3.4.0"
    }
    nsxt = {
      source = "vmware/nsxt"
      version = "~> 3.2.5"
    }
  }

  backend "s3" {
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

variable "nsxUser" {
  type = string
}

variable "nsxPassword" {
  type = string
}

variable "nsxManager" {
  type = string
}

provider "vcd" {
  user                 = var.vcdUser
  password             = var.vcdPassword
  auth_type            = "integrated"
  org                  = var.defaultOrg
  url                  = var.vcdHost
}

provider "nsxt" {
  host                  = var.nsxManager
  username              = var.nsxUser
  password              = var.nsxPassword
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

module "vdc" {
    source = "./modules/vclouddirector"
}

module "nsxt" {
    source = "./modules/nsxt"
}