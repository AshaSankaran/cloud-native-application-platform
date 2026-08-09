output "virtual_network_name" {
    description = "Azure Virtual Network Name"
    value = azurerm_virtual_network.vnet.name
}

output "virtual_network_id" {
    description = "Azure Virtual Network ID"
    value =  azurerm_virtual_network.vnet.id
}

output "aks_subnet_name" {
    description = "Azure Subnet Name for AKS"
    value = azurerm_subnet.aks-Subnet.name
}

output "aks_subnet_id" {
    description = "AKS Subnet ID"
    value = azurerm_subnet.aks-Subnet.id
}