## Global Variables ##
variable "aws_region" {
  type = string
  default = "eu-west-2"
}

## VCD Variables ##
variable "vcd_host" {
  type = string
}

variable "vcd_user" {
  type = string
}

variable "vcd_password" {
  type = string
}

variable "default_org" {
  type = string
}

## NSX-T Variables ##
variable "nsx_user" {
  type = string
}

variable "nsx_password" {
  type = string
}

variable "nsx_manager" {
  type = string
}

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

## NSX-T Variables Segments ##
