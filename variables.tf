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

##

## NSX-T Variables Segments ##

  variable "man_segement_display_name" {
    type  = string
  }

  variable "lds_segment_display_name" {
    type  = string
  }

  variable "overlay_segment_name" {
    type  = string
  }

  variable "man_segement_vlan_ids" {
    type  = list(string)
  }

  variable "lds_segement_vlan_ids" {
    type  = list(string)
  }

  variable "overlay_segment_subnet_address" {
    type  = string
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

##

## NSX-T Tier-0 Gateway Variables ##

  variable "t0_vrf_gateway_name" {
    type  = string
  }

##

## NSX-T Tier-1 Gateway Variables ##

  variable "t1_vrf_gateway_name" {
    type  = string
  }

##

## VCD Customer VDC Variables ##
  variable "vdc_name" {
    type  = string
  }

  variable "provider_vdc_name" {
    type  = string
  }

  variable "provider_network_pool" {
    type  = string
  }

  variable "cpu_allocation" {
    type  = number
  }

  variable "ram_allocation" {
    type  = number
  }

##

## VCD NSX-T Network Variables ##

  variable "network_name" {
    type  = string
  }

  variable "start_address" {
    type  = string
  }

  variable "end_address" {
    type  = string
  }

  variable "primary_dns_ip" {
    type  = string
  }

  variable "secondary_dns_ip" {
    type  = string
  }

##