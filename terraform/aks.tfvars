tenant_id       = "5339548a-1c7e-4cba-907c-53871445fce0"
subscription_id = "fe88f330-5f60-4dcd-be53-bb19bf5c9434"
location        = "uksouth"

aks_cluster = {
  name          = "aks-cluster-dilan"
  sku_tier      = "Free"
  identity_type = "SystemAssigned"
  default_node_pool = {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }
}
