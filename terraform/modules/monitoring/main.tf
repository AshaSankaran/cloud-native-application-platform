resource "azurerm_monitor_diagnostic_setting" "aks_diagnostic_setting" {
    name = var.diagnostic_setting_name
    target_resource_id = var.aks_id
    log_analytics_workspace_id = var.log_analytics_workspace_id

    enabled_metric {
        category = "AllMetrics"
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

