module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.rg_name
  location            = var.location
}

module "virtual_network" {
  source = "./modules/network"

  resource_group_name           = module.resource_group.resource_group_name
  location                      = module.resource_group.location
  virtual_network_name          = var.vnet_name
  virtual_network_address_space = var.vnet_address_space
  aks_subnet_name               = var.aks_subnet_name
  aks_subnet_prefix             = var.aks_subnet_prefix
}

module "azure_container_registry" {
  source = "./modules/acr"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  acr_name            = var.acr_name
  acr_sku             = var.acr_sku
  admin_enabled       = var.admin_enabled
}

module "azure_kubernetes_cluster" {
  source = "./modules/aks"

  aks_name                   = var.aks_name
  resource_group_name        = module.resource_group.resource_group_name
  location                   = module.resource_group.location
  aks_subnet_id              = module.virtual_network.aks_subnet_id
  dns_prefix                 = var.dns_prefix
  node_count                 = var.node_count
  vm_size                    = var.vm_size
  log_analytics_workspace_id = azurerm_log_analytics_workspace.monitoring-workspace.id
}

module "role_assignment" {
  source = "./modules/rbac"

  principal_id         = module.azure_kubernetes_cluster.kubelet_identity_object_id
  acr_id               = module.azure_container_registry.acr_id
  role_definition_name = var.role_definition_name
}

module "monitoring" {
  source = "./modules/monitoring"

  aks_id                     = module.azure_kubernetes_cluster.aks_id
  aks_name                   = module.azure_kubernetes_cluster.aks_name
  resource_group_name        = module.resource_group.resource_group_name
  location                   = module.resource_group.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.monitoring-workspace.id
  alert_email                = var.alert_email
  diagnostic_setting_name    = var.diagnostic_setting_name
  action_group_name          = var.action_group_name
  ag_short_name              = var.ag_short_name
  cpu_metric_alert_name      = var.cpu_metric_alert_name
  memory_metric_alert_name   = var.memory_metric_alert_name
  pod_restart_alert_name     = var.pod_restart_alert_name
}