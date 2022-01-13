/*=====================
Create Tier 0 VRF Gateway Interfaces
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway_interface
=======================*/

resource "nsxt_policy_tier0_gateway_interface" "tf_man_int" {
  display_name   = var.man_t0_interface_name
  type           = "EXTERNAL"
  edge_node_path = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9/edge-nodes/0"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.tf_man_vlan_seg.path 
  subnets        = var.manchester_interface_subnet
}

resource "nsxt_policy_tier0_gateway_interface" "tf_lds_int" {
  display_name   = var.lds_t0_interface_name
  type           = "EXTERNAL"
  edge_node_path = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9/edge-nodes/1"
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.tf_lds_vlan_seg.path
  subnets        = var.leeds_interface_subnet
}