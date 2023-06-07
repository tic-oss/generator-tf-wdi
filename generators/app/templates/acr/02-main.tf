############################### AZURE CONTAINER REGISTRY ##############################################

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = true
  # georeplications {
  #   location                = "East US"
  #   zone_redundancy_enabled = true
  #   tags                    = {}
  # }
}

resource "null_resource" "push_to_acr" {
  depends_on = [azurerm_container_registry.acr]

  provisioner "local-exec" {
    command = "powershell.exe -ExecutionPolicy Bypass -File D:/TIC/Azure_Terraform/modules/acr/push_image.ps1 -registryName ${azurerm_container_registry.acr.name}"
  }
}

resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "az aks update -n nandinicluster -g TIC --attach-acr ${azurerm_container_registry.acr.name} "
  }
  depends_on = [azurerm_container_registry.acr]
}





