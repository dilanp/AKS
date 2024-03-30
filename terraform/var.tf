
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
    name = string
  })
}
