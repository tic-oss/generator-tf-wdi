data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "cluster" {
  name = "${var.cluster_name}"
  depends_on = [
    aws_eks_cluster.aws_eks_cluster_tic,
  <%_ if(enableECK) { _%>
    aws_eks_node_group.eck-node-group,
  <%_ } _%>
    aws_eks_node_group.apps-node-group
  ]
}
