variable "subnetGateway" {
  type = string
}

variable "subnetRange" {
  type = string
}

variable "transportZone" {
  type = string
}

data "nsxt_policy_transport_zone" "TZ" {
  display_name = var.transportZone
}


/*==============
Create segments
===============*/

resource "nsxt_policy_fixed_segment" "dev-test-segment" {
  display_name        = "Dev Test Segment"
  description         = "Terraform provisioned Dev Test Segment"
  connectivity_path = nsxt_policy_tier1_gateway.mygateway.path
}
