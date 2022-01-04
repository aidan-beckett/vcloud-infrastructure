terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
      version = "~> 3.2.5"
    }
  }
}

resource "nsxt_policy_vlan_segment" "tf-test-man" {
  display_name        = "TF-TEST-MAN"
  description         = "Terraform provisioned VLAN Segment MAN"
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/2ab7b77f-c4d4-483e-9686-09b0ecd99ba3"
  vlan_ids = ["1550"]
}


resource "nsxt_policy_vlan_segment" "tf-test-lds" {
  display_name        = "TF-TEST-LDS"
  description         = "Terraform provisioned VLAN Segment LDS"
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/0b85d17b-4160-4083-b548-1d596b62b5ec"
  vlan_ids = ["1750"]
}