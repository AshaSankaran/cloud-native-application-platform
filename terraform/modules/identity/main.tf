resource "azurerm_user_assigned_identity" "backend_identity" {
  name                = var.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_federated_identity_credential" "backend_oidc" {
  name      = var.backend_oidc_name
  user_assigned_identity_id = azurerm_user_assigned_identity.backend_identity.id

  audience = [
    "api://AzureADTokenExchange"
  ]

  issuer  = var.oidc_issuer_url
  subject = "system:serviceaccount:cloud-native-app:backend-sa"
}