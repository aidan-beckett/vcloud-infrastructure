# BGP Neighbor Configuration
resource "nsxt_policy_bgp_neighbor" "router_a" {
    display_name        = "ToR-A"
    description         = "Terraform provisioned BGP Neighbor Configuration"
    bgp_path            = nsxt_policy_tier0_gateway.tier0_gw.bgp_config.0.path
    neighbor_address    = "192.168.101.1"
    remote_as_num       = "65001"
}
 
resource "nsxt_policy_bgp_neighbor" "router_b" {
    display_name        = "ToR-B"
    description         = "Terraform provisioned BGP Neighbor Configuration"
    bgp_path            = nsxt_policy_tier0_gateway.tier0_gw.bgp_config.0.path
    neighbor_address    = "192.168.102.1"
    remote_as_num       = "65002"
}