variable "region" {
  type    = string
  default = <%- "\""+awsRegion+"\"" %>
}

variable "tags" {
  type        = map(string)
  default = {
    APP = <%- "\""+projectName+"\"" %>
  }
}