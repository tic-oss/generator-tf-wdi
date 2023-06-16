<<<<<<< HEAD
<%_ if (minikube == "false") { _%>
=======
<%_ if (cloudProvider == "aws") { _%>
>>>>>>> 92ab2c638720281a94f5872946fd4fb5c45237c6
variable "region" {
  type    = string
  default = <%- "\""+awsRegion+"\"" %>
}
<%_ } _%>
<<<<<<< HEAD

=======
<%_ if (cloudProvider == "azure") { _%>
variable "location" {
  type    = string
  default = <%- "\""+location+"\"" %>
}
<%_ } _%>
>>>>>>> 92ab2c638720281a94f5872946fd4fb5c45237c6
