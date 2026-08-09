variable "rg_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Azure Virtual Network Name"
  type        = string
}

variable "vnet_address_space" {
  description = "Address Space for the Virutal Network"
  type        = list(string)
}

variable "aks_subnet_name" {
  description = "AKS Subnet Name"
  type        = string
}

variable "aks_subnet_prefix" {
  description = "Address Prefix for the AKS Subnet"
  type        = list(string)
}

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

variable "aks_name" {
  description = "AKS Cluster Name"
  type        = string
}

variable "dns_prefix" {
  description = "DNS Prefix for AKS"
  type        = string
}

variable "node_count" {
  description = "Initial number of AKS nodes"
  type        = number
}

variable "vm_size" {
  description = "AKS Node VM Size"
  type        = string
}

variable "role_definition_name" {
  description = "Azure RBAC role to assign"
  type        = string
}