/*=====================
Create BGP Neighbors
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway
=======================*/

resource "nsxt_policy_bgp_neighbor" "man_bgp_neighbor" {
  display_name          = var.man_bgp_neighbour_name  
  bgp_path              = nsxt_policy_tier0_gateway.tier0_gw.bgp_config.0.path
  allow_as_in           = true
  neighbor_address      = var.man_bgp_neighbour_address
  remote_as_num         = var.remote_as_num 
  source_addresses      = nsxt_policy_tier0_gateway_interface.man_t0_int[0].ip_addresses 
  bfd_config {
    enabled  = true
    interval = 1000
    multiple = 4
  }

  route_filtering {
    address_family   = var.address_family
  }
}

resource "nsxt_policy_bgp_neighbor" "lds_bgp_neighbor" {
  display_name          = var.lds_bgp_neighbour_name
  bgp_path              = nsxt_policy_tier0_gateway.tier0_gw.bgp_config.0.path
  allow_as_in           = true
  neighbor_address      = var.lds_bgp_neighbour_address 
  remote_as_num         = var.remote_as_num 
  source_addresses      = nsxt_policy_tier0_gateway_interface.lds_t0_int[0].ip_addresses 
  bfd_config {
    enabled  = true
    interval = 1000
    multiple = 4
  }

  route_filtering {
    address_family   = var.address_family
  }
}