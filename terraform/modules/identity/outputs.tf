output "user_assigned_managedidentity_id" {
  description = "Managed identity resource ID"
  value       = azurerm_user_assigned_identity.backend_identity.id
}

output "client_id" {
  description = "Managed identity client ID"
  value       = azurerm_user_assigned_identity.backend_identity.client_id
}

output "principal_id" {
  description = "Managed Identity Principal ID"
  value       = azurerm_user_assigned_identity.backend_identity.principal_id
}

output "federated_identity_credential_id" {
  description = "Federated identity credential ID"
  value       = azurerm_federated_identity_credential.backend_oidc.id
}