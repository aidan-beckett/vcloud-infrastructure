variable "edgeCluster" {
  type = string
}

variable "gatewayPath" {
  type = string
}

data "nsxt_policy_edge_cluster" "EC" {
  display_name = var.edgeCluster
}

data "nsxt_policy_tier0_gateway" "parent" {
  display_name = var.gatewayPath
}

/*=====================
Create Tier 0 VRF Gateways
https://registry.terraform.io/providers/vmware/nsxt/latest/docs/resources/policy_tier0_gateway
=======================*/

resource "nsxt_policy_tier0_gateway" "tier0-vrf" {
  description              = "Terraform provisioned Dev Test Tier-0 VRF"
  display_name             = "Tier0-vrf"
  failover_mode            = "PREEMPTIVE"
  default_rule_logging     = false
  enable_firewall          = true
  ha_mode                  = "ACTIVE_STANDBY"
  internal_transit_subnets = ["102.64.0.0/16"]
  transit_subnets          = ["101.64.0.0/16"]
  edge_cluster_path        = data.nsxt_policy_edge_cluster.EC.path

  bgp_config {
    ecmp = true

    route_aggregation {
      prefix = "12.10.10.0/24"
    }
  }

  vrf_config {
    gateway_path        = data.nsxt_policy_tier0_gateway.parent.path
    route_distinguisher = "62000:10"
    evpn_transit_vni    = 76001
    route_target {
      auto_mode      = false
      import_targets = ["62000:2"]
      export_targets = ["62000:3", "10.2.2.0:3"]
    }
  }
}