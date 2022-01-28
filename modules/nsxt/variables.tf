## NSX-T Variables BGP Neighbours ##

variable "man_bgp_neighbour_name" {
  type  = string
  description = "BGP neighbour name"
}

variable "lds_bgp_neighbour_name" {
  type  = string
  description = "BGP neighbour name"
}

variable "man_bgp_neighbour_address" {
  type  = string
  description = "Neighbor IP Address"
}

variable "lds_bgp_neighbour_address" {
  type  = string
  description = "Neighbor IP Address"
}

variable "remote_as_num" {
  type  = number
  description = "ASN of the neighbor in ASPLAIN/ASDOT Format"
  default = 59778
}

variable "address_family" {
  type  =  string
  description = "Address family type. Must be one of L2VPN_EVPN, IPV4 or IPV6" 
  default = "IPV4"
}

variable "bpg_neighbor_allow_as_in" {
  type  =  bool
  description = "Flag to enable allowas_in option for BGP neighbor." 
  default = true
}

variable "bfd_config_enabled" {
  type  =  bool
  description = "A boolean flag to enable/disable BFD" 
  default = true
}

variable "bfd_config_interval" {
  type  =  number
  description = "Time interval between heartbeat packets in milliseconds." 
  default = 1000
}

variable "bfd_config_multiple" {
  type  =  number
  description = "Number of times heartbeat packet is missed before BFD declares the neighbor is down." 
  default = 4
}

##

## NSX-T Variables Segments ##

  variable "man_segment_display_name" {
    type  = string
  }

  variable "lds_segment_display_name" {
    type  = string
  }

  variable "overlay_segment_name" {
    type  = string
  }

  variable "man_segment_vlan_ids" {
    type  = list(string)
  }

  variable "lds_segment_vlan_ids" {
    type  = list(string)
  }

  variable "overlay_segment_subnet_address" {
    type  = string
  }

  variable "man_segment_transport_zone_path" {
    type  =  string
    default = "/infra/sites/default/enforcement-points/default/transport-zones/2ab7b77f-c4d4-483e-9686-09b0ecd99ba3"
  }

  variable "lds_segment_transport_zone_path" {
    type  =  string
    default = "/infra/sites/default/enforcement-points/default/transport-zones/0b85d17b-4160-4083-b548-1d596b62b5ec"
  }

  variable "overlay_segment_transport_zone_path" {
    type  =  string
    default = "/infra/sites/default/enforcement-points/default/transport-zones/839090f3-a229-4753-9a20-94c51d6da2bb"
  }
##

## NSX-T Tier-0 Gateway Interface Variables ##

  variable "man_t0_interface_name" {
    type  = string
  }

  variable "lds_t0_interface_name" {
    type  = string
  }

  variable "man_t0_interface_subnet" {
    type  = list(string)
  }

  variable "lds_t0_interface_subnet" {
    type  = list(string)
  }

  variable "t0_interface_type" {
    type  = string
    default = "EXTERNAL"
  }
  
  variable "man_t0_interface_edge_node_path" {
    type  = string
    default = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9/edge-nodes/0"
  }

  variable "lds_t0_interface_edge_node_path" {
    type  = string
    default = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9/edge-nodes/1"
  }
##

## NSX-T Tier-0 Gateway Variables ##

  variable "t0_vrf_gateway_name" {
    type  = string
  }

  variable "t0_vrf_gateway_failover_mode" {
    type  = string
    default = "NON_PREEMPTIVE"
  }

  variable "t0_vrf_gateway_default_rule_logging" {
    type  = bool
    default = false
  }

  variable "t0_vrf_gateway_enable_firewall" {
    type  = bool
    default = true
  }

  variable "t0_vrf_gateway_ha_mode" {
    type  = string
    default = "ACTIVE_ACTIVE"
  }

  variable "t0_vrf_gateway_edge_cluster_path" {
    type  = string
    default = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9"
  }

  variable "t0_vrf_gateway_bpg_config" {
     type = object({
      ecmp = bool
    })

    default = {
      ecmp = true
    }
  }

  variable "t0_vrf_gateway_vrf_config" {
     type = object({
      gateway_path = string
    })

    default = {
      gateway_path = "/infra/tier-0s/T0-WW"
    }
  }

##

## NSX-T Tier-1 Gateway Variables ##

  variable "t1_vrf_gateway_name" {
    type  = string
  }

  variable "t1_vrf_gateway_edge_cluster_path" {
    type  = string
    default = "/infra/sites/default/enforcement-points/default/edge-clusters/28bc1328-1eb3-4078-8ed7-699b4b9c9ab9"
  }

  variable "t1_vrf_gateway_failover_mode" {
    type  = string
    default = "PREEMPTIVE"
  }

  variable "t1_vrf_gateway_pool_allocation" {
    type  = string
    default = "PREEMPTIVE"
  }

  variable "t1_vrf_gateway_route_advertisement_types" {
    type  = list(string)
    default = ["TIER1_CONNECTED"]
  }

##