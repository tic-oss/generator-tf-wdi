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
  #skip_provider_registration = true
  subscription_id = <%- "\""+subscriptionID+"\"" %>
  tenant_id       = <%- "\""+tenantID+"\"" %>
  #client_id       = "f838ca01-f6b0-4ba0-a43e-d425a936cabb"
  #client_secret   = "IOl8Q~fCE.2s1miL01ih5~StvjuJ.05pDkBVea8J"
  
}

