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
  source = "./modules/nsxt"

  man_bgp_neighbour_name    = var.man_bgp_neighbour_name
  lds_bgp_neighbour_name    = var.lds_bgp_neighbour_name
  man_bgp_neighbour_address = var.man_bgp_neighbour_address
  lds_bgp_neighbour_address = var.lds_bgp_neighbour_address
  remote_as_num             = var.remote_as_num
  address_family            = var.address_family

  man_segment_display_name  = var.man_segment_display_name
  lds_segment_display_name  = var.lds_segment_display_name
  overlay_segment_name      = var.overlay_segment_name
  man_segment_vlan_ids      = var.man_segment_vlan_ids
  lds_segment_vlan_ids      = var.lds_segment_vlan_ids
  overlay_segment_subnet_address = var.overlay_segment_subnet_address

  man_t0_interface_name     = var.man_t0_interface_name
  lds_t0_interface_name     = var.lds_t0_interface_name
  man_t0_interface_subnet   = var.man_t0_interface_subnet
  lds_t0_interface_subnet   = var.lds_t0_interface_subnet

  t0_vrf_gateway_name       = var.t0_vrf_gateway_name

  t1_vrf_gateway_name       = var.t1_vrf_gateway_name
}

module "vdc" {
  source = "./modules/vclouddirector"
  create_new_org            = var.create_new_org
  org_name                  = var.org_name
  org_full_name             = var.org_full_name

  network_name              = var.network_name
  provider_vdc_name         = var.provider_vdc_name
  provider_network_pool     = var.provider_network_pool
  cpu_allocation            = var.cpu_allocation
  ram_allocation            = var.ram_allocation

  vdc_name                  = var.vdc_name
  overlay_segment_name      = var.overlay_segment_name
  overlay_segment_subnet_address = var.overlay_segment_subnet_address
  start_address             = var.start_address
  end_address               = var.end_address
  primary_dns_ip            = var.primary_dns_ip
  secondary_dns_ip          = var.secondary_dns_ip

  vm_configs                = var.vm_configs
}