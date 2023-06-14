<%_ if (minikube == "false" || minikube == undefined) { _%>
variable "region" {
  type    = string
  default = <%- "\""+awsRegion+"\"" %>
}
<%_ } _%>

