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

  aks_name            = var.aks_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  aks_subnet_id       = module.virtual_network.aks_subnet_id
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.vm_size
}

module "role_assignment" {
  source = "./modules/rbac"

  principal_id         = module.azure_kubernetes_cluster.kubelet_identity_object_id
  acr_id               = module.azure_container_registry.acr_id
  role_definition_name = var.role_definition_name
}