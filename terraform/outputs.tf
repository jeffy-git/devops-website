output "resource_group_name" {
  description = "Name of the Azure Resource Group"
  value       = azurerm_resource_group.devops_rg.name
}

output "acr_login_server" {
  description = "Login server URL for the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

output "kube_config" {
  description = "Raw Kubernetes config for AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive   = true
}
