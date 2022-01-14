resource "vcd_org" "customer_org" {
  count     = var.create_new_org ? 1 : 0
  name      = var.org_name
  full_name = var.org_full_name
  description = "Terraform provisioned Org"
  delete_recursive = false
  delete_force  = false
}