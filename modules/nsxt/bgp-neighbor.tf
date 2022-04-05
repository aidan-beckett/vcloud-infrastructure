/*=====================
Create BGP Neighbors
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway
=======================*/

resource "nsxt_policy_bgp_neighbor" "bgp_neighbor" {
  display_name          = var.bgp_neighbour_name  
  bgp_path              = nsxt_policy_tier0_gateway.tier0_gw.bgp_config[0].path
  allow_as_in           = true
  neighbor_address      = var.bgp_neighbour_address
  remote_as_num         = var.remote_as_num 
  source_addresses      = nsxt_policy_tier0_gateway_interface.t0_int.ip_addresses 
  bfd_config {
    enabled  = var.bfd_config_enabled
    interval = var.bfd_config_interval
    multiple = var.bfd_config_multiple
  }

  route_filtering {
    address_family   = var.address_family
  }
}