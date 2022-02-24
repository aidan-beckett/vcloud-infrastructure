
resource "vcd_org_vdc" "customer_vdc" {
    name = var.vdc_name
    allocation_model = "Flex"
    description = "Terraform provisioned VDC"
    provider_vdc_name = var.provider_vdc_name
    network_pool_name = var.provider_network_pool
    network_quota     = 1
    org               = var.create_new_org? vcd_org.customer_org[0].name : var.org_name

    compute_capacity {
        cpu {
            allocated = var.cpu_allocation
        }

        memory {
            allocated = var.ram_allocation
        }
    }

    storage_profile {
        name = "*"
        enabled = true
        limit = 0
        default = true
    }

    metadata = {
        role    = "Terraform"
        env     = "prod"
        version = "v1"
    }

  elasticity               = true
  include_vm_memory_overhead = false
  enabled                  = true
  enable_thin_provisioning = true
  enable_fast_provisioning = false
  delete_force             = true
  delete_recursive         = true
}