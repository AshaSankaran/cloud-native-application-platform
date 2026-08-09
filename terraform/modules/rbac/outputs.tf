output "role_definition_name" {
    description = "Assigned Azure RBAC Role"
    value = azurerm_role_assignment.aks_acr_pull.role_definition_name
}

output "role_assignment_id" {
  description = "AKS-ACR Pull Role Assignment ID"
  value       = azurerm_role_assignment.aks_acr_pull.id
}