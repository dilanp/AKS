terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }

  required_version = ">= 1.7.0"

  backend "azurerm" {
    resource_group_name  = "rg-dilan-aks-backend"
    storage_account_name = "sadilanaksbackend"
    container_name       = "tfstate"
    key                  = "aks.tfstate"
  }
}


provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  features {
  }
}
