terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  required_version = ">=1.12.2"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}