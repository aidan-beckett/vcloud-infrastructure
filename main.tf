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

# provider "vcd" {
#   user                 = var.vcdUser
#   password             = var.vcdPassword
#   auth_type            = "integrated"
#   org                  = var.defaultOrg
#   url                  = var.vcdHost
# }

provider "nsxt" {
  host                  = var.nsx_manager
  username              = var.nsx_user
  password              = var.nsx_password
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

# module "vdc" {
#     source = "./modules/vclouddirector"
# }

module "nsxt" {
    source = "./modules/nsxt/test"
    bgp_neighbour_name_man =var.bgp_neighbour_name_man
    bgp_neighbour_name_lds = var.bgp_neighbour_name_lds
    bgp_neighbour_address_man = var.bgp_neighbour_address_man
    bgp_neighbour_address_lds = var.bgp_neighbour_address_lds
    remote_as_num = var.remote_as_num
    address_family = var.address_family
}