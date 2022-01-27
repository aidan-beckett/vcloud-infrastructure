/*=====================
Create Tier 0 VRF Gateways
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway
=======================*/

resource "nsxt_policy_tier0_gateway" "tier0_gw" {
  display_name             = var.t0_vrf_gateway_name
  failover_mode            = "NON_PREEMPTIVE"
  default_rule_logging     = false
  enable_firewall          = true
  ha_mode                  = "ACTIVE_ACTIVE"
  edge_cluster_path        = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9"

  bgp_config {
    ecmp = true
  }

  vrf_config {
    gateway_path = "/infra/tier-0s/T0-WW"
  }
}
