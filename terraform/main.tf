# ==============================
# Terraform Azure DevOps Project
# ==============================


# ==========================
# 1️⃣ Resource Group
# ==========================
resource "azurerm_resource_group" "devops_rg" {
  name     = "devops-rg"
  location = "eastus"
}

# ==========================
# 2️⃣ Azure Container Registry
# ==========================
resource "azurerm_container_registry" "acr" {
  name                = "devopsregistry2025"
  resource_group_name = azurerm_resource_group.devops_rg.name
  location            = azurerm_resource_group.devops_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# ==========================
# 3️⃣ Azure Kubernetes Service (AKS)
# ==========================
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "devops-aks"
  location            = azurerm_resource_group.devops_rg.location
  resource_group_name = azurerm_resource_group.devops_rg.name
  dns_prefix          = "devopscluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_container_registry.acr]
}
