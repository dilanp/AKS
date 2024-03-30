
# Retrieve the local IP Address.
data "external" "local_ip" {
  program = ["pwsh", "-command", "& {(Invoke-WebRequest -uri 'ipinfo.io').Content | ConvertFrom-Json | select ip | convertto-json}"]
}

# Resource group for the backend.
resource "azurerm_resource_group" "backend_resource_group" {
  name     = "rg-${var.backend_name}"
  location = var.location
}

resource "azurerm_storage_account" "backend_storage_account" {
  name                              = "sa${replace(var.backend_name, "-", "")}"
  resource_group_name               = azurerm_resource_group.backend_resource_group.name
  location                          = azurerm_resource_group.backend_resource_group.location
  account_kind                      = "StorageV2"
  account_tier                      = "Standard"
  account_replication_type          = "GRS"
  access_tier                       = "Hot"
  allow_nested_items_to_be_public   = false
  infrastructure_encryption_enabled = true
}

# Create containers and blobs inside them.
resource "azurerm_storage_container" "backend_storage_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend_storage_account.name
  container_access_type = "private"
}

# Create the network rule for storage account.
resource "azurerm_storage_account_network_rules" "tf_storage_account_network_rules" {
  storage_account_id         = azurerm_storage_account.backend_storage_account.id
  default_action             = "Deny"
  bypass                     = ["AzureServices"]
  ip_rules                   = [data.external.local_ip.result.ip]
  virtual_network_subnet_ids = []

  lifecycle {
    ignore_changes = [private_link_access]
  }
}
