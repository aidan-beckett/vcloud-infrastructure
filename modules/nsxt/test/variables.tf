## NSX-T Variables BGP Neighbours ##

variable "bgp_neighbour_name_man" {
  type  = string
  description = "BGP neighbour name"
}

variable "bgp_neighbour_name_lds" {
  type  = string
  description = "BGP neighbour name"
}

variable "bgp_neighbour_address_man" {
  type  = string
  description = "Neighbor IP Address"
}

variable "bgp_neighbour_address_lds" {
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

## NSX-T Variables Segments

  variable "man_display_name" {
    type  = string
  }

  variable "lds_display_name" {
    type  = string
  }

  variable "overlay_segment_name" {
    type  = string
  }

  variable "segement_man_vlan_ids" {
    type  = list(string)
  }

  variable "segement_lds_vlan_ids" {
    type  = list(string)
  }

  variable "segment_subnet_address" {
    type  = string
  }

## NSX-T Tier-0 Gateway Interface Variables

  variable "man_t0_interface_name" {
    type  = string
  }

  variable "lds_t0_interface_name" {
    type  = string
  }

  variable "manchester_interface_subnet" {
    type  = list(string)
  }

  variable "leeds_interface_subnet" {
    type  = list(string)
  }