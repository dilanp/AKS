
variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}

variable "aks_cluster" {
  type = object({
    name          = string
    sku_tier      = string
    identity_type = string
    default_node_pool = object({
      name       = string
      node_count = string
      vm_size    = string
    })
  })
}
