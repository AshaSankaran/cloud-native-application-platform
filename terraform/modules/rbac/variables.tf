variable "acr_principal_id" {
  description = "Principal ID of the AKS kubelet managed identity"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry ID"
  type        = string
}

variable "acr_role_definition_name" {
  description = "Azure RBAC role to assign for AcrPull"
  type        = string
  default     = "AcrPull"
}

variable "backend_role_definition_name" {
  description = "Name of backend workload identity"
  type        = string
}

variable "backend_principal_id" {
  description = "Principal ID of the backend workload identity"
  type        = string
}

variable "key_vault_id" {
  description = "Azure Key Vault Resource ID"
  type        = string
}