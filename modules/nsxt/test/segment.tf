terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
      version = "~> 3.2.5"
    }
  }
}

resource "nsxt_policy_vlan_segment" "tf-man-seg" {
  display_name        = "TF-TEST-MAN"
  description         = "Terraform provisioned VLAN Segment MAN"
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/2ab7b77f-c4d4-483e-9686-09b0ecd99ba3"
  vlan_ids = ["1550"]
}

resource "nsxt_policy_vlan_segment" "tf-test-lds" {
  display_name        = "TF-TEST-LDS"
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/0b85d17b-4160-4083-b548-1d596b62b5ec"
  vlan_ids = ["1750"]
}

resource "nsxt_policy_segment" "tf-test-srvlan" {
  display_name        = "TF-TEST-SRVLAN"
  connectivity_path   = nsxt_policy_tier1_gateway.tier1_gw.path
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/839090f3-a229-4753-9a20-94c51d6da2bb"

  subnet {
    cidr        = "172.16.255.1/24"
  }

  tag {
    scope = "SYSTEM"
    tag   = "urn:vcloud:org:8769c3e0-6daf-494d-9506-adc86a93862b"
  }

  tag {
    scope = "SYSTEM"
    tag   = "urn:vcloud:vdc:7450d6ac-7763-4b38-a1e7-29ee4431d3e6"
  }
}