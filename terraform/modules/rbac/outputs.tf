output "acr_role_definition_name" {
  description = "Assigned Azure RBAC Role"
  value       = azurerm_role_assignment.aks_acr_pull.role_definition_name
}

output "acr_role_assignment_id" {
  description = "AKS-ACR Pull Role Assignment ID"
  value       = azurerm_role_assignment.aks_acr_pull.id
}

output "backend_role_definition_name" {
  description = "Backend-Keyvault Role Assignment Name"
  value       = azurerm_role_assignment.backend_key_vault_secrets_user.role_definition_name
}

output "backend_role_assignment_id" {
  description = "Backend-Keyvault Role Assignment ID"
  value       = azurerm_role_assignment.backend_key_vault_secrets_user.id
}