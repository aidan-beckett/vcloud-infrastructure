## VCD Customer VDC Variables
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

## VCD NSX-T Network Variables

  variable "network_name" {
    type  = string
  }

  variable "overlay_segment_name" {
    type  = string
  }

  variable "overlay_segment_subnet_address" {
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