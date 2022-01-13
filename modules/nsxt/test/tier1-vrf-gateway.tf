/*=====================
Create Tier 1 VRF Gateways
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway
=======================*/

resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  display_name              = "V800040:TF-TEST-TIER1"
  edge_cluster_path         = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9"
  failover_mode             = "PREEMPTIVE"
  tier0_path                = nsxt_policy_tier0_gateway.tier0-gw.path
  pool_allocation           = "ROUTING"
  route_advertisement_types = ["TIER1_CONNECTED"]
}