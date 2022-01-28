resource "nsxt_policy_vlan_segment" "man_vlan_seg" {
  count               = var.man_segment_display_name != "" ? 1 : 0 
  display_name        = var.man_segment_display_name
  transport_zone_path = var.man_segment_transport_zone_path
  vlan_ids = var.man_segment_vlan_ids
}

resource "nsxt_policy_vlan_segment" "lds_vlan_seg" {
  count               = var.lds_segment_display_name != "" ? 1 : 0 
  display_name        = var.lds_segment_display_name
  transport_zone_path = var.lds_segment_transport_zone_path
  vlan_ids = var.lds_segment_vlan_ids
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