resource "nsxt_policy_vlan_segment" "tf_man_vlan_seg" {
  count               = var.man_display_name != "" ? 1 : 0 
  display_name        = var.man_display_name
  description         = "Terraform provisioned VLAN Segment Manchester"
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/2ab7b77f-c4d4-483e-9686-09b0ecd99ba3"
  vlan_ids = var.segement_man_vlan_ids;
}

resource "nsxt_policy_vlan_segment" "tf_lds_vlan_seg" {
  count               = var.lds_display_name != "" ? 1 : 0 
  display_name        = var.lds_display_name
  description         = "Terraform provisioned VLAN Segment Leeds"
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/0b85d17b-4160-4083-b548-1d596b62b5ec"
  vlan_ids = var.segement_lds_vlan_ids
}

resource "nsxt_policy_segment" "tf_overlay_seg" {
  display_name        = var.overlay_segment_name
  description         = "Terraform provisioned Overlay Segment"
  connectivity_path   = nsxt_policy_tier1_gateway.tier1_gw.path
  transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/839090f3-a229-4753-9a20-94c51d6da2bb"

  subnet {
    cidr        = var.segment_subnet_address
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