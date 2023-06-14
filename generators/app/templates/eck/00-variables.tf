<%_ if (minikube == "false" || minikube == undefined) { _%>
variable "cluster_name" {
  type    = string
  default = <%- "\""+clusterName+"\"" %>
}

variable "region" {
  type    = string
  default = <%- "\""+awsRegion+"\"" %>
}
<%_ } _%>