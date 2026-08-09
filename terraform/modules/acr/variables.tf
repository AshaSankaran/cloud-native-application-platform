variable "acr_name" {
  description = "Azure Container Registry Name"
  type        = string
}

variable "acr_sku" {
  description = "Azure Container Registry SKU"
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Enable ACR Admin Account"
  type        = bool
  default     = false
}
variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Resource Group location"
  type        = string
}