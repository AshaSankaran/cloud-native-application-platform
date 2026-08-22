output "key_vault_name" {
  description = "Azure Key Vault Name"
  value       = azurerm_key_vault.key_vault.name
}

output "key_vault_id" {
  description = "Azure Key Vault ID"
  value       = azurerm_key_vault.key_vault.id
}
