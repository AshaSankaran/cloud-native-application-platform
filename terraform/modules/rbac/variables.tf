variable "principal_id" {
    description = "Principal ID of the AKS managed identity"
    type = string
}

variable "acr_id" {
    description = "Azure Container Registry ID"
    type = string
}

variable "role_definition_name" {
    description = "Azure RBAC role to assign"
    type = string
    default = "AcrPull"
}