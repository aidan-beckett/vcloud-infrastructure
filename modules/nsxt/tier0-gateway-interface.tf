/*=====================
Create Tier 0 VRF Gateway Interfaces
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway_interface
=======================*/

resource "nsxt_policy_tier0_gateway_interface" "tf-man-int" {
  display_name   = "TF-TEST-MAN-INT"
  type           = "EXTERNAL"
  edge_node_path = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9/edge-nodes/0"
  gateway_path   = nsxt_policy_tier0_gateway.tier0-gw.path
  segment_path   = nsxt_policy_vlan_segment.tf-test-man.path 
  subnets        = ["172.31.160.5/31"]
  mtu            = 1500
}

resource "nsxt_policy_tier0_gateway_interface" "tf-lds-int" {
  display_name   = "TF-TEST-LDS-INT"
  type           = "EXTERNAL"
  edge_node_path = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9/edge-nodes/1"
  gateway_path   = nsxt_policy_tier0_gateway.tier0-gw.path
  segment_path   = nsxt_policy_vlan_segment.tf-test-lds.path
  subnets        = ["172.31.160.7/31"]
  mtu            = 1500
}