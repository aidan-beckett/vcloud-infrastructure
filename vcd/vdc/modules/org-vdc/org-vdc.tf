terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "~> 3.4.0"
    }
  }
}

resource "vcd_org_vdc" "cust-vcd-test" {
    name = "test vcd update"
    allocation_model = "Flex"
    description = "Terraform Template Spike"
    provider_vdc_name = "LDS-AZ1"
    network_pool_name = "LDS-NETPOOL1"

    compute_capacity {
        cpu {
            allocated = 1000
        }

        memory {
            allocated = 1024
        }
    }

    storage_profile {
        name = "*"
        enabled = true
        limit = 0
        default = true
    }

    metadata = {
        role    = "Devs"
        env     = "staging"
        version = "v1"
    }

  elasticity               = true
  include_vm_memory_overhead = true
  enabled                  = true
  enable_thin_provisioning = true
  enable_fast_provisioning = false
  delete_force             = true
  delete_recursive         = true
}