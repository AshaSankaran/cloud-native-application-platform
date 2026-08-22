variable "aks_name" {
  description = "Azure Kubernetes Service Name"
  type        = string
}

variable "dns_prefix" {
  description = "AKS DNS Prefix Name"
  type        = string
}

variable "node_count" {
  description = "AKS Node Count"
  type        = number
}

variable "vm_size" {
  description = "AKS Node VM Size"
  type        = string
}

variable "aks_subnet_id" {
  description = "AKS Node(VM) Subnet ID"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID used by AKS monitoring"
  type        = string
}