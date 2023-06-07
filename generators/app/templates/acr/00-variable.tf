variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = <%- "\""+"rg-"+projectName+"\"" %>
}
variable "acr_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = <%- "\""+"acr"+projectName+"\"" %> 
}

variable "location" {
  description = "Location (Azure Region)."
  type    = string
  default = <%- "\""+location+"\"" %>
}
variable "acr_sku" {
  type        = string
  description = "The SKU of the Azure Container Registry"
  default     = "Basic"
}

variable "image_name" {
  type        = string
  description = "Name of the Docker Image"
  default     = "postgres"
}

variable "image_tag" {
  type        = string
  description = "Name of the Docker tag"
  default     = "1.2"
}




 












