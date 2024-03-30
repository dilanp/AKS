
# Resource group for AKS Cluster.
resource "azurerm_resource_group" "aks_resource_group" {
  name     = "rg-${var.aks_cluster.name}"
  location = var.location
}

# Create the AKS Cluster.
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster.name
  location            = azurerm_resource_group.aks_resource_group.location
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  dns_prefix          = replace(var.aks_cluster.name, "-", "")
  node_resource_group = "${azurerm_resource_group.aks_resource_group.name}-nodes"
  sku_tier            = var.aks_cluster.sku_tier

  default_node_pool {
    name       = var.aks_cluster.default_node_pool.name
    node_count = var.aks_cluster.default_node_pool.node_count
    vm_size    = var.aks_cluster.default_node_pool.vm_size

    upgrade_settings {
      max_surge = var.aks_cluster.default_node_pool.upgrade_settings.max_surge
    }
  }

  identity {
    type = var.aks_cluster.identity_type
  }
}
