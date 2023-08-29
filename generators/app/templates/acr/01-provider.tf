terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

