data "nsxt_policy_tier0_gateway" "tier0_gw" {
  display_name = "gw1"
}

data "nsxt_policy_ipv6_ndra_profile" "slaac" {
  display_name = "slaac"
}

/*=====================
Create Tier 0 VRF Gateways Interfaces
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway_interface
=======================*/

resource "nsxt_policy_tier0_gateway_interface" "tier0_vrf_if_01" {
  display_name   = "Tier0-vrf-if-01"
  description    = "Tier 0 VRF Gateways Interface"
  type           = "EXTERNAL"
  edge_node_path = data.nsxt_policy_edge_node.edge_node_1.path
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.vrf_trunk_1.path
  access_vlan_id = 112
  subnets        = ["192.168.112.254/24"]
  mtu            = 1500
  depends_on = [nsxt_policy_tier0_gateway_interface.parent_uplink1]
}

resource "nsxt_policy_tier0_gateway_interface" "tier0_vrf_if_02" {
  display_name   = "Tier0-vrf-if-02"
  description    = "Tier 0 VRF Gateways Interface"
  type           = "EXTERNAL"
  edge_node_path = data.nsxt_policy_edge_node.edge_node_2.path
  gateway_path   = nsxt_policy_tier0_gateway.tier0_gw.path
  segment_path   = nsxt_policy_vlan_segment.vrf_trunk_2.path
  access_vlan_id = 113
  subnets        = ["192.168.113.254/24"]
  mtu            = 1500
  depends_on = [nsxt_policy_tier0_gateway_interface.parent_uplink1]
}