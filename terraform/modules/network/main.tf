resource "azurerm_virtual_network" "vnet" {
    name = var.virtual_network_name
    resource_group_name = var.resource_group_name
    location = var.location
    address_space = var.virtual_network_address_space
}

resource "azurerm_subnet" "aks-Subnet" {
    name = var.aks_subnet_name
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.aks_subnet_prefix
}