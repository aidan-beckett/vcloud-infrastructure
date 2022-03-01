

resource "vcd_vm" "vms" {
  depends_on    = [vcd_nsxt_network_imported.nsxt_backed]
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
    ip_allocation_mode = "DHCP"
  }
}

locals {
  vm_disk_map = flatten([
    for vm_config, vm_config in var.vm_configs : [
      for disk_config, disk_config in vm_config.disk_configs: 
      {
        "vm_name" = vm_config.vm_name,
        "vm_disk_config" = disk_config
      } 
    ]
  ])
}

resource "vcd_vm_internal_disk" "disks" {
  depends_on = [vcd_vm.vms]
  for_each   = {for config in local.vm_disk_map: "${config.vm_name}.${config.vm_disk_config.bus_number}" => config}

  org           = var.create_new_org? vcd_org.customer_org[0].name : var.org_name
  vdc           = vcd_org_vdc.customer_vdc.name

  allow_vm_reboot = true

  vapp_name = vcd_vm.vms[each.value.vm_name].vapp_name
  vm_name   = each.value.vm_name
  bus_type  = each.value.vm_disk_config.bus_type
  size_in_mb = each.value.vm_disk_config.disk_size
  bus_number = each.value.vm_disk_config.bus_number
  unit_number = each.value.vm_disk_config.unit_number
}