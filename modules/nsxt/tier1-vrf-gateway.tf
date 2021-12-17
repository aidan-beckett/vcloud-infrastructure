data "nsxt_policy_tier0_gateway" "T0" {
  display_name = "T0"
}

data "nsxt_policy_edge_cluster" "EC" {
  display_name = "EC"
}

/*=====================
Create Tier 1 VRF Gateways
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier1_gateway
=======================*/

resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  description               = "Tier-1 VRF gateway provisioned by Terraform"
  display_name              = "Tier1-gw-01"
  nsx_id                    = "predefined_id"
  edge_cluster_path         = data.nsxt_policy_edge_cluster.EC.path
  failover_mode             = "PREEMPTIVE"
  default_rule_logging      = "false"
  enable_firewall           = "true"
  enable_standby_relocation = "false"
  tier0_path                = data.nsxt_policy_tier0_gateway.T0.path
  route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED"]
  pool_allocation           = "ROUTING"
}