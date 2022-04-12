/*=====================
Create Tier 0 VRF Gateway Interfaces
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway_interface
=======================*/

resource "nsxt_policy_tier0_gateway_interface" "primary_t0_int" {
  display_name   = var.t0_interface_name
  type           = var.t0_interface_type
  edge_node_path = var.t0_interface_edge_node_path
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.primary_vlan_seg.path 
  subnets        = var.t0_interface_subnet
}

resource "nsxt_policy_tier0_gateway_interface" "backup_t0_int" {
  count          = var.backup_t0_interface_name != "" ? 1 : 0
  display_name   = var.backup_t0_interface_name
  type           = var.t0_interface_type
  edge_node_path = var.backup_t0_interface_edge_node_path
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.backup_vlan_seg[0].path 
  subnets        = var.backup_t0_interface_subnet
}