/*=====================
Create Tier 1 VRF Gateways
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway
=======================*/

resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  display_name              = var.t1_vrf_gateway_name
  edge_cluster_path         = var.t1_vrf_gateway_edge_cluster_path
  failover_mode             = var.t1_vrf_gateway_failover_mode
  tier0_path                = nsxt_policy_tier0_gateway.tier0_gw.path
  pool_allocation           = var.t1_vrf_gateway_pool_allocation
  route_advertisement_types = var.t1_vrf_gateway_route_advertisement_types
}