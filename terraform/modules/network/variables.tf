variable "virtual_network_name" {
    description = "Virtual Network Name"
    type = string
}

variable "virtual_network_address_space" {
    description = "Address Space for Virtual Network"
    type = list(string)
}

variable "aks_subnet_name" {
    description = "AKS Subnet Name"
    type = string
}

variable "aks_subnet_prefix" {
    description = "Address Prefix for Subnet"
    type = list(string)
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}