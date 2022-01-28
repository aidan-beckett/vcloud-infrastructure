/*=====================
Create Tier 0 VRF Gateway Interfaces
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway_interface
=======================*/

resource "nsxt_policy_tier0_gateway_interface" "man_t0_int" {
  count          = var.man_segment_display_name != "" ? 1 : 0 
  display_name   = var.man_t0_interface_name
  type           = var.t0_interface_type
  edge_node_path = var.man_t0_interface_edge_node_path
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.man_vlan_seg[0].path 
  subnets        = var.man_t0_interface_subnet
}

resource "nsxt_policy_tier0_gateway_interface" "lds_t0_int" {
  count          = var.lds_segment_display_name != "" ? 1 : 0 
  display_name   = var.lds_t0_interface_name
  type           = var.t0_interface_type
  edge_node_path = var.lds_t0_interface_edge_node_path
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.lds_vlan_seg[0].path
  subnets        = var.lds_t0_interface_subnet
}