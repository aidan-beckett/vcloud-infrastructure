


## VCD Login Variables ##

  variable "vcd_user" {
    type  = string
    sensitive = true
  }

  variable "vcd_password" {
    type  = string
    sensitive = true
  }

  variable "default_org" {
    type  = string
    sensitive = true
  }

  variable "vcd_host" {
    type  = string
    sensitive = true
  }

##

## NSX-T Login Variables ##

  variable "nsx_user" {
    type  = string
    sensitive = true
  }

  variable "nsx_password" {
    type  = string
    sensitive = true
  }

  variable "nsx_manager" {
    type  = string
    sensitive = true
  }

##

variable "nsxt_config" {
  type = object({
    bgp = object({
      bgp_neighbour_name = string
      bgp_neighbour_address = string
      backup_bgp_neighbour_name = string
      backup_bgp_neighbour_address = string
      remote_as_num = number
      address_family = string
    })
    segment = object({
      segment_display_name = string
      vlan_ids = list(string)
      transport_zone_path = string
      backup_segment_display_name = string
      backup_segment_vlan_ids = list(string)
      backup_segment_transport_zone_path = string
      overlay_segment_name = string
      overlay_segment_subnet_address = string
      overlay_segment_transport_zone_path = string
    })
    t0_gateway_interface = object({
      t0_interface_name = string
      t0_interface_subnet = string
      interface_type = string
      edge_node_path = string
      backup_t0_interface_name = string
      backup_t0_interface_subnet = string
      backup_interface_type = string
      backup_edge_node_path = string
    })
    t0_gateway = object({
      gateway_name = string
      failover_mode = string
      gateway_path = string
      edge_cluster_path = string
    })
    t1_gateway = object({
      gateway_name = string
      failover_mode = string
      pool_allocation = string
      route_advertisement_types = string
      edge_cluster_path = string
    })
  })
  default = null

}

variable "vcd_config" {
  type = object({
    org = object({
      create_new_org = string
      org_name = string
      org_full_name = string
    })
    customer_vdc = object({
      vdc_name = string
      provider_vdc_name = string
      provider_network_pool = string
      cpu_allocation = string
      ram_allocation = string
    })
    network = object({
      network_name = string
      start_address = string
      end_address = string
      overlay_segment_name = string
      overlay_segment_subnet_address = string
      primary_dns_ip = string
      secondary_dns_ip = string
    })
    vms_config = list(object({
      vm_name = string
      template_name = string
      cpus = number
      memory = number
      vm_ip = string
    }))
  })
  default = null
}