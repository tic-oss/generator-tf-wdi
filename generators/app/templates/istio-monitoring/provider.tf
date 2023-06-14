<%_ if (minikube == "false" || minikube == undefined) { _%>
  terraform {
  required_providers {
    aws = {
    source = "hashicorp/aws"
    }
  }
  }
<%_ } _%>

provider "kubernetes" {
  config_path = "~/.kube/config"
}

<%_ if (minikube == "false" || minikube == undefined) { _%>
provider "aws" {
  region     = var.region
}
<%_ } _%>