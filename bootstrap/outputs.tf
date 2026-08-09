output "resource_group_name" {
  description = "Azure Backend Resource Group Name"
  value       = azurerm_resource_group.backend_rg.name
}

output "resource_group_id" {
  description = "Azure Backend Resource Group ID"
  value       = azurerm_resource_group.backend_rg.id
}

output "storage_account_name" {
  description = "Azure Backend Storage Account Name"
  value       = azurerm_storage_account.tfstate.name
}

output "storage_account_id" {
  description = "Azure Backend Storage Account ID"
  value       = azurerm_storage_account.tfstate.id
}

output "storage_container_name" {
  description = "Azure Backend storage container Name"
  value       = azurerm_storage_container.tfstate.name
}

output "storage_container_id" {
  description = "Azure Backend storage container ID"
  value       = azurerm_storage_container.tfstate.id
}