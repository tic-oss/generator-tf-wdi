<%_ if (minikube == "false") { _%>
variable "region" {
  type    = string
  default = <%- "\""+awsRegion+"\"" %>
}
<%_ } _%>

