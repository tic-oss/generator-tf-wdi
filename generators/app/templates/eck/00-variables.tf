<%_ if (minikube == "false") { _%>
variable "cluster_name" {
  type    = string
  default = <%- "\""+clusterName+"\"" %>
}

variable "region" {
  type    = string
  default = <%- "\""+awsRegion+"\"" %>
}
<%_ } _%>