
# Resource group for AKS Cluster.
resource "azurerm_resource_group" "aks_resource_group" {
  name     = "rg-${var.aks_cluster.name}"
  location = var.location
}
