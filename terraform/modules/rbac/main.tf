resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = var.acr_id
  principal_id         = var.acr_principal_id
  role_definition_name = var.acr_role_definition_name
}

resource "azurerm_role_assignment" "backend_key_vault_secrets_user" {
  scope                = var.key_vault_id
  principal_id         = var.backend_principal_id
  role_definition_name = var.backend_role_definition_name
}