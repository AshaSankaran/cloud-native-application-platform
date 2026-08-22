variable "identity_name" {
  description = "User-Assigned Managed Identity Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "oidc_issuer_url" {
  description = "AKS OIDC issuer URL"
  type        = string
}

variable "backend_oidc_name" {
  description = "AKS OIDC Name"
  type        = string
}
