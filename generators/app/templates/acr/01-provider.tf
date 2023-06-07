terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  #subscription_id   = "81d11f56-93d4-4ecf-ab8a-b083965af423"
}

