
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.3.2"
    }
  }

  required_version = ">= 1.7.0"
}


provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  features {
  }
}
