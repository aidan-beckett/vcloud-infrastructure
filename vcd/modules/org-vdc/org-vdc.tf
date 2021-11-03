resource "vcd_org_vcd" "cust-vcd-test" {
    name = "test vcd"
    allocation_model = "Flex"
    description = "Terraform Template Spike"
    provider_vdc_name = "LDS-AZ1"
    network_pool_name = "LDS-NETPOOL1"

    compute_capacity {
        cpu {
            allocated = 1024
        }

        memory {
            allocated = 1024
        }
    }

    storage_profile {
        name = "test-storage-policy"
        enabled = true
        limit = 0
        default = true
    }

    metadata = {
        role    = "Devs"
        env     = "staging"
        version = "v1"
    }

  enabled                  = true
  enable_thin_provisioning = true
  enable_fast_provisioning = false
  delete_force             = true
  delete_recursive         = true
}