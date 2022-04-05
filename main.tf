terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "~> 3.4.0"
    }
    nsxt = {
      source = "vmware/nsxt"
      version = "~> 3.2.5"
    }
  }

  //backend "s3" {
    
  //}
}                        


provider "vcd" {
  user       = var.vcd_user
  password   = var.vcd_password
  auth_type  = "integrated"
  org        = var.default_org
  url        = var.vcd_host
  allow_unverified_ssl = true
}

provider "nsxt" {
  host                  = var.nsx_manager
  username              = var.nsx_user
  password              = var.nsx_password
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

module "nsxt" {
  for_each = {for nsxt_config in var.nsxt_config_array: nsxt_config.t0_gateway.gateway_name => nsxt_config}

  source = "./modules/nsxt"

  bgp_neighbour_name        = each.value.bgp.bgp_neighbour_name
  bgp_neighbour_address     = each.value.bgp.bgp_neighbour_address
  remote_as_num             = each.value.bgp.remote_as_num
  address_family            = each.value.bgp.address_family

  segment_display_name      = each.value.segment.segment_display_name
  overlay_segment_name      = each.value.segment.overlay_segment_name
  vlan_ids                  = each.value.segment.vlan_ids
  transport_zone_path       = each.value.segment.transport_zone_path
  overlay_segment_subnet_address = each.value.segment.overlay_segment_subnet_address
  overlay_segment_transport_zone_path = each.value.segment.overlay_segment_transport_zone_path

  t0_interface_name         = each.value.t0_gateway_interface.t0_interface_name
  t0_interface_subnet       = [each.value.t0_gateway_interface.t0_interface_subnet]
  t0_interface_type         = each.value.t0_gateway_interface.interface_type
  t0_interface_edge_node_path = each.value.t0_gateway_interface.edge_node_path

  t0_vrf_gateway_name       = each.value.t0_gateway.gateway_name
  t0_vrf_gateway_failover_mode = each.value.t0_gateway.failover_mode
  t0_vrf_gateway_path       = each.value.t0_gateway.gateway_path
  t0_vrf_gateway_edge_cluster_path = each.value.t0_gateway.edge_cluster_path


  t1_vrf_gateway_name       = each.value.t1_gateway.gateway_name
  t1_vrf_gateway_edge_cluster_path = each.value.t1_gateway.edge_cluster_path
  t1_vrf_gateway_failover_mode = each.value.t1_gateway.failover_mode
  t1_vrf_gateway_pool_allocation = each.value.t1_gateway.pool_allocation
  t1_vrf_gateway_route_advertisement_types = [each.value.t1_gateway.route_advertisement_types]
}

module "vdc" {
  for_each = { for vcd_config in var.vcd_config_array: vcd_config.org.org_name => vcd_config }
  source = "./modules/vclouddirector"

  create_new_org            = each.value.org.create_new_org
  org_name                  = each.value.org.org_name
  org_full_name             = each.value.org.org_full_name

  vdc_name                  = each.value.customer_vdc.vdc_name
  provider_vdc_name         = each.value.customer_vdc.provider_vdc_name
  provider_network_pool     = each.value.customer_vdc.provider_network_pool
  cpu_allocation            = each.value.customer_vdc.cpu_allocation
  ram_allocation            = each.value.customer_vdc.ram_allocation

  network_name              = each.value.network.network_name
  overlay_segment_name      = each.value.network.overlay_segment_name
  overlay_segment_subnet_address = each.value.network.overlay_segment_subnet_address
  start_address             = each.value.network.start_address
  end_address               = each.value.network.end_address
  primary_dns_ip            = each.value.network.primary_dns_ip
  secondary_dns_ip          = each.value.network.secondary_dns_ip

  vms_config                = each.value.vms_config
}