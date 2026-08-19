resource "azurerm_kubernetes_cluster" "aks" {
    name = var.aks_name
    resource_group_name = var.resource_group_name
    location = var.location
    dns_prefix = var.dns_prefix

    default_node_pool {
        name = "system"
        node_count = var.node_count
        vm_size = var.vm_size
        vnet_subnet_id = var.aks_subnet_id

        upgrade_settings {
            max_surge                     = "10%"
            drain_timeout_in_minutes     = 0
            node_soak_duration_in_minutes = 0
  }
    }

    identity {
        type = "SystemAssigned"
    }

    oms_agent {
        log_analytics_workspace_id = var.log_analytics_workspace_id
    }

    network_profile {
        network_plugin      = "azure"
        network_plugin_mode = "overlay"
        load_balancer_sku   = "standard"
    }

    role_based_access_control_enabled = true

}
