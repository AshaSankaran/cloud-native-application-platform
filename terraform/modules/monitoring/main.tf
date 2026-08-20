resource "azurerm_monitor_diagnostic_setting" "aks_diagnostic_setting" {
    name = var.diagnostic_setting_name
    target_resource_id = var.aks_id
    log_analytics_workspace_id = var.log_analytics_workspace_id

    enabled_log {
      category = "kube-audit-admin"
  }
    enabled_log {
      category = "kube-apiserver"
  }

    enabled_log {
      category = "kube-controller-manager"
  }

    enabled_log {
      category = "kube-scheduler"
  }

    enabled_log {
      category = "cluster-autoscaler"
  }
}

resource "azurerm_monitor_action_group" "aks_action_group" {
    name = var.action_group_name
    resource_group_name = var.resource_group_name
    short_name = var.ag_short_name

    email_receiver {
        name = "primary"
        email_address = var.alert_email
    }
}

resource "azurerm_monitor_metric_alert" "aks_metric_cpu" {
    name = var.cpu_metric_alert_name
    resource_group_name = var.resource_group_name
    scopes = [var.aks_id]

    description = "Alert when AKS CPU usage is high"

    severity = 2

    criteria {
        metric_namespace = "Microsoft.ContainerService/managedClusters"
        metric_name = "node_cpu_usage_percentage"
        aggregation = "Average"
        operator = "GreaterThan"
        threshold = 70
    }

    action {
        action_group_id = azurerm_monitor_action_group.aks_action_group.id
    }
}

resource "azurerm_monitor_metric_alert" "aks_metric_memory" {
    name = var.memory_metric_alert_name
    resource_group_name = var.resource_group_name
    scopes = [var.aks_id]

    description = "Alert when AKS memory usuage is high"

    severity = 2
    frequency = "PT5M"
    window_size = "PT15M"

    criteria {
        metric_namespace = "Microsoft.ContainerService/managedClusters"
        metric_name = "node_memory_working_set_percentage"
        aggregation = "Average"
        operator = "GreaterThan"
        threshold = 80
    }

    action {
        action_group_id = azurerm_monitor_action_group.aks_action_group.id
    }
}