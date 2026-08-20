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

resource "azurerm_monitor_scheduled_query_rules_alert_v2" "pod_restarts" {
    name = var.pod_restart_alert_name
    resource_group_name = var. resource_group_name
    location = var.location
    scopes = [var.log_analytics_workspace_id]

    display_name = "AKS Application pod restart alert"
    description = "Alert when an application container restarts more than twice within 10 minutes."
    severity = 2
    enabled = true
    evaluation_frequency = "PT5M"
    window_duration = "PT10M"

    criteria {
        query = <<-QUERY
          KubePodInventory
          | where TimeGenerated >= ago(10m)
          | where Namespace == "cloud-native-app"
          | where ContainerRestartCount > 2
          | extend LastStatus = todynamic(ContainerLastStatus)
          | where todatetime(LastStatus.startedAt) >= ago(10m)
          | summarize RestartingContainers = count() by bin(TimeGenerated, 5m)
        QUERY

        time_aggregation_method = "Total"
        metric_measure_column   = "RestartingContainers"
        operator                = "GreaterThan"
        threshold               = 0

        failing_periods {
            minimum_failing_periods_to_trigger_alert = 1
            number_of_evaluation_periods             = 1
    }
  }

  action {
        action_groups = [azurerm_monitor_action_group.aks_action_group.id]
    }
}

