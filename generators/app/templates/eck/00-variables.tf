<<<<<<< HEAD
<%_ if (minikube == "false") { _%>
=======
<%_ if (cloudProvider == "aws") { _%>
>>>>>>> 92ab2c638720281a94f5872946fd4fb5c45237c6
variable "cluster_name" {
  type    = string
  default = <%- "\""+clusterName+"\"" %>
}
<%_ } _%>
<%_ if (cloudProvider == "azure") { _%>
variable "eck_node_pool" {
  description = "name of the eck node pool."
  type        = string
  default     = "ecknodepool" 
}
<<<<<<< HEAD
<%_ } _%>
=======

variable "apps_node_pool" {
  description = "name of the apps node pool."
  type        = string
  default     = "appnodepool" 
}
<%_ } _%>
>>>>>>> 92ab2c638720281a94f5872946fd4fb5c45237c6
