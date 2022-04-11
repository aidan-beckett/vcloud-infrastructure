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
  count = var.nsxt_config != null ? 1 : 0

  source = "./modules/nsxt"

  bgp_neighbour_name        = var.nsxt_config.bgp.bgp_neighbour_name
  bgp_neighbour_address     = var.nsxt_config.bgp.bgp_neighbour_address
  backup_bgp_neighbour_name        = var.nsxt_config.bgp.backup_bgp_neighbour_name
  backup_bgp_neighbour_address     = var.nsxt_config.bgp.backup_bgp_neighbour_address
  remote_as_num             = var.nsxt_config.bgp.remote_as_num
  address_family            = var.nsxt_config.bgp.address_family

  segment_display_name      = var.nsxt_config.segment.segment_display_name
  vlan_ids                  = var.nsxt_config.segment.vlan_ids
  transport_zone_path       = var.nsxt_config.segment.transport_zone_path
  backup_segment_display_name      = var.nsxt_config.segment.backup_segment_display_name
  backup_vlan_ids                  = var.nsxt_config.segment.backup_segment_vlan_ids
  backup_transport_zone_path       = var.nsxt_config.segment.backup_segment_transport_zone_path
  overlay_segment_name      = var.nsxt_config.segment.overlay_segment_name
  overlay_segment_subnet_address = var.nsxt_config.segment.overlay_segment_subnet_address
  overlay_segment_transport_zone_path = var.nsxt_config.segment.overlay_segment_transport_zone_path

  t0_interface_name         = var.nsxt_config.t0_gateway_interface.t0_interface_name
  t0_interface_subnet       = [var.nsxt_config.t0_gateway_interface.t0_interface_subnet]
  t0_interface_type         = var.nsxt_config.t0_gateway_interface.interface_type
  t0_interface_edge_node_path = var.nsxt_config.t0_gateway_interface.edge_node_path
  backup_t0_interface_name         = var.nsxt_config.t0_gateway_interface.backup_t0_interface_name
  backup_t0_interface_subnet       = [var.nsxt_config.t0_gateway_interface.backup_t0_interface_subnet]
  backup_t0_interface_type         = var.nsxt_config.t0_gateway_interface.backup_interface_type
  backup_t0_interface_edge_node_path = var.nsxt_config.t0_gateway_interface.backup_edge_node_path

  t0_vrf_gateway_name       = var.nsxt_config.t0_gateway.gateway_name
  t0_vrf_gateway_failover_mode = var.nsxt_config.t0_gateway.failover_mode
  t0_vrf_gateway_path       = var.nsxt_config.t0_gateway.gateway_path
  t0_vrf_gateway_edge_cluster_path = var.nsxt_config.t0_gateway.edge_cluster_path

  t1_vrf_gateway_name       = var.nsxt_config.t1_gateway.gateway_name
  t1_vrf_gateway_edge_cluster_path = var.nsxt_config.t1_gateway.edge_cluster_path
  t1_vrf_gateway_failover_mode = var.nsxt_config.t1_gateway.failover_mode
  t1_vrf_gateway_pool_allocation = var.nsxt_config.t1_gateway.pool_allocation
  t1_vrf_gateway_route_advertisement_types = [var.nsxt_config.t1_gateway.route_advertisement_types]
}

module "vdc" {
  count = var.vcd_config != null ? 1 : 0
  source = "./modules/vclouddirector"

  create_new_org            = var.vcd_config.org.create_new_org
  org_name                  = var.vcd_config.org.org_name
  org_full_name             = var.vcd_config.org.org_full_name

  vdc_name                  = var.vcd_config.customer_vdc.vdc_name
  provider_vdc_name         = var.vcd_config.customer_vdc.provider_vdc_name
  provider_network_pool     = var.vcd_config.customer_vdc.provider_network_pool
  cpu_allocation            = var.vcd_config.customer_vdc.cpu_allocation
  ram_allocation            = var.vcd_config.customer_vdc.ram_allocation

  network_name              = var.vcd_config.network.network_name
  overlay_segment_name      = var.vcd_config.network.overlay_segment_name
  overlay_segment_subnet_address = var.vcd_config.network.overlay_segment_subnet_address
  start_address             = var.vcd_config.network.start_address
  end_address               = var.vcd_config.network.end_address
  primary_dns_ip            = var.vcd_config.network.primary_dns_ip
  secondary_dns_ip          = var.vcd_config.network.secondary_dns_ip

  vms_config                = var.vcd_config.vms_config
}