/*=====================
Create Tier 0 VRF Gateways
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway
=======================*/

resource "nsxt_policy_tier0_gateway" "tier0_gw" {
  display_name             = var.t0_vrf_gateway_name
  failover_mode            = var.t0_vrf_gateway_failover_mode
  default_rule_logging     = false
  enable_firewall          = true
  ha_mode                  = "ACTIVE_ACTIVE"
  edge_cluster_path        = var.t0_vrf_gateway_edge_cluster_path

  bgp_config {
    ecmp = true
  }

  vrf_config {
    gateway_path = var.t0_vrf_gateway_path
  }
}