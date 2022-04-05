/*=====================
Create Tier 0 VRF Gateway Interfaces
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway_interface
=======================*/

resource "nsxt_policy_tier0_gateway_interface" "t0_int" {
  display_name   = var.t0_interface_name
  type           = var.t0_interface_type
  edge_node_path = var.t0_interface_edge_node_path
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.vlan_seg.path 
  subnets        = var.t0_interface_subnet
}
