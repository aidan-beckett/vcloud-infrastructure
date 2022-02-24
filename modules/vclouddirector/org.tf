resource "vcd_org" "customer_org" {
  count            = var.create_new_org ? 1 : 0
  name             = var.org_name
  full_name        = var.org_full_name
  description      = "Terraform provisioned Org"
  delete_recursive = true
  delete_force     = true

  vapp_lease {
    maximum_runtime_lease_in_sec          = 0
    power_off_on_runtime_lease_expiration = false
    maximum_storage_lease_in_sec          = 0 # never expires
    delete_on_storage_lease_expiration    = false
  }
}