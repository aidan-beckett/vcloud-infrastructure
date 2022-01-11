/*=====================
Create BGP Neighbors
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway
=======================*/

resource "nsxt_policy_bgp_neighbor" "tf-man-bgp-neighbor" {
  display_name          = var.bgp_neighbour_name_man 
  bgp_path              = nsxt_policy_tier0_gateway.tier0-gw.bgp_config.0.path
  allow_as_in           = true
  neighbor_address      = var.bgp_neighbour_address_man 
  remote_as_num         = var.remote_as_num 
  source_addresses      = nsxt_policy_tier0_gateway_interface.tf-man-int.ip_addresses 
  bfd_config {
    enabled  = true
    interval = 1000
    multiple = 4
  }

  route_filtering {
    address_family   = var.address_family
  }
}

resource "nsxt_policy_bgp_neighbor" "tf-lds-bgp-neighbor" {
  display_name          = var.bgp_neighbour_name_lds 
  bgp_path              = nsxt_policy_tier0_gateway.tier0-gw.bgp_config.0.path
  allow_as_in           = true
  neighbor_address      = var.bgp_neighbour_address_lds 
  remote_as_num         = var.remote_as_num 
  source_addresses      = nsxt_policy_tier0_gateway_interface.tf-lds-int.ip_addresses 
  bfd_config {
    enabled  = true
    interval = 1000
    multiple = 4
  }

  route_filtering {
    address_family   = var.address_family
  }
}