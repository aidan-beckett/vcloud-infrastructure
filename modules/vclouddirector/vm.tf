resource "vcd_vm" "vms" {
  for_each      = {for vm_config in var.vm_configs: vm_config.vm_name => vm_config}

  org           = var.create_new_org? vcd_org.customer_org[0].name : var.org_name
  vdc           = vcd_org_vdc.customer_vdc.name
  sizing_policy_id = vcd_org_vdc.customer_vdc.default_vm_sizing_policy_id
  catalog_name  = "OS Library"
  template_name = each.value.template_name
  name          = each.value.vm_name

  cpus          = each.value.cpus
  cpu_cores     = each.value.cpus
  memory        = each.value.memory

  network {

    name        = var.network_name
    type        = "org"
    ip_allocation_mode = "MANUAL"
    ip          = each.value.vm_ip

  }

  dynamic "disk" {
    for_each      = {for disk_config in each.value.disk_configs: disk_config.disk_name => disk_config}
    content {
      name        = disk.value.disk_name
      bus_number  = disk.value.bus_number
      unit_number = disk.value.unit_number
    }

  }
}