output "resource_group_name" {
  description = "Azure Resource Group Name"
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Azure Resource Group ID"
  value       = module.resource_group.resource_group_id
}

output "location" {
  description = "Azure Region"
  value       = module.resource_group.location
}

output "virtual_network_name" {
  description = "Azure Virtual Network Name"
  value       = module.virtual_network.virtual_network_name
}

output "virtual_network_id" {
  description = "Azure Virtual Network ID"
  value       = module.virtual_network.virtual_network_id
}

output "aks_subnet_name" {
  description = "Azure Subnet Name"
  value       = module.virtual_network.aks_subnet_name
}

output "aks_subnet_id" {
  description = "Azure Subnet ID"
  value       = module.virtual_network.aks_subnet_id
}

output "acr_name" {
  description = "Azure Container Registry Name"
  value       = module.azure_container_registry.acr_name
}

output "acr_id" {
  description = "Azure Container Registry ID"
  value       = module.azure_container_registry.acr_id
}

output "acr_login_server" {
  description = "Azure Container Registry Login Server"
  value       = module.azure_container_registry.acr_login_server
}

output "aks_name" {
  description = "Azure Kubernetes Cluster Name"
  value       = module.azure_kubernetes_cluster.aks_name
}

output "aks_id" {
  description = "Azure Kubernetes Cluster ID"
  value       = module.azure_kubernetes_cluster.aks_id
}

output "aks_kubernetes_version" {
  description = "AKS Kubernetes Version"
  value       = module.azure_kubernetes_cluster.aks_kubernetes_version
}

output "aks_node_resource_group" {
  description = "AKS Managed Resource Group"
  value       = module.azure_kubernetes_cluster.aks_node_resource_group
}

output "aks_fqdn" {
  description = "AKS API Server Endpoint FQDN"
  value       = module.azure_kubernetes_cluster.aks_fqdn
}

output "aks_principal_id" {
  description = "AKS System Assigned Identity Principal ID"
  value       = module.azure_kubernetes_cluster.principal_id
}

output "role_definition_name" {
  description = "Assigned Azure RBAC Role"
  value       = module.role_assignment.role_definition_name
}

output "role_assignment_id" {
  description = "AKS-ACR Pull Role Assignment ID"
  value       = module.role_assignment.role_assignment_id
}