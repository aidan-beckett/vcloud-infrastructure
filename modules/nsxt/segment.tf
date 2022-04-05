resource "nsxt_policy_vlan_segment" "vlan_seg" {
  display_name        = var.segment_display_name
  transport_zone_path = var.transport_zone_path
  vlan_ids = var.vlan_ids
}


resource "nsxt_policy_segment" "overlay_seg" {
  display_name        = var.overlay_segment_name
  connectivity_path   = nsxt_policy_tier1_gateway.tier1_gw.path
  transport_zone_path = var.overlay_segment_transport_zone_path

  subnet {
    cidr  = var.overlay_segment_subnet_address
  }

  tag {
    scope = "SYSTEM"
    tag   = "urn:vcloud:org:"
  }

  tag {
    scope = "SYSTEM"
    tag   = "urn:vcloud:vdc:"
  }
}