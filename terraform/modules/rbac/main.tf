resource "azurerm_role_assignment" "aks_acr_pull" {
    scope = var.acr_id
    principal_id = var.principal_id
    role_definition_name = var.role_definition_name
}