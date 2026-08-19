resource "azurerm_log_analytics_workspace" "monitoring-workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  sku                 = var.workspace_sku
  retention_in_days   = var.workspace_retentiondays
}