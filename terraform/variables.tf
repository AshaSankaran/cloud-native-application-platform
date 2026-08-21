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

variable "workspace_name" {
  description = "Log Analytics Workspace Name"
  type        = string
}

variable "workspace_sku" {
  description = "Log Analytics Workspace SKU"
  type        = string
}

variable "workspace_retentiondays" {
  description = "Log Analytics Workspace Retention Days"
  type        = number
}

variable "diagnostic_setting_name" {
  description = "Monitoring Diagnostic Setting Name"
  type        = string
}

variable "action_group_name" {
  description = "Monitoring Action Group Name"
  type        = string
}

variable "ag_short_name" {
  description = "Monitoring Action Group Short Name"
  type        = string
}

variable "alert_email" {
  description = "Monitoring Alert Email Address"
  type        = string
}

variable "cpu_metric_alert_name" {
  description = "AKS CPU Metrics Alert Name"
  type        = string
}

variable "memory_metric_alert_name" {
  description = "AKS Memory Metrics Alert Name"
  type        = string
}

variable "pod_restart_alert_name" {
  description = "AKS Application Pod Restart Alert"
  type        = string
}

variable "key_vault_name" {
  description = "Azure Key Vault Name"
  type        = string
}