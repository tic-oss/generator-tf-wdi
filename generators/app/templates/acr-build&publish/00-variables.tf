variable "location" {
  description = "Location (Azure Region)."
  type    = string
  default = <%- "\""+location+"\"" %>
}

variable "acr_name" {
  description = "Name of the resource group to be imported."
  type        = string
  default     = <%- "\""+"acr"+projectName+"\"" %> 
}
