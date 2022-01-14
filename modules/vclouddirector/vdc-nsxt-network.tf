
resource "vcd_nsxt_network_imported" "nsxt_backed" {
  vdc         = vcd_org_vdc.customer_vdc.name
  name        = var.network_name
  description = "Terraform provisioned NSXT Network"
  nsxt_logical_switch_name = var.overlay_segment_name

  gateway     = split("/", var.overlay_segment_subnet_address)[0]
  prefix_length = tonumber(split("/", var.overlay_segment_subnet_address)[1])

  static_ip_pool {
    start_address = var.start_address
    end_address   = var.end_address
  }

  dns1        = var.primary_dns_ip
  dns2        = var.secondary_dns_ip
}