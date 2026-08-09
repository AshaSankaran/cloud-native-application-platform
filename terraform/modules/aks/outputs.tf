
output "aks_name" {
  description = "Azure Kubernetes Cluster Name"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_id" {
  description = "Azure Kubernetes Cluster ID"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_kubernetes_version" {
  description = "AKS Kubernetes Version"
  value       = azurerm_kubernetes_cluster.aks.kubernetes_version
}

output "aks_node_resource_group" {
  description = "AKS Managed Resource Group"
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "aks_fqdn" {
  description = "AKS API Server Endpoint FQDN"
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

output "principal_id" {
  description = "AKS System Assigned Identity Principal ID"
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "kubelet_identity_object_id" {
  description = "AKS Kubelet Identity Object ID"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}