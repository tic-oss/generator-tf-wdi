<%_ if (minikube == "false") { _%>
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

<%_ if (minikube == "false") { _%>
provider "aws" {
  region     = var.region
}
<%_ } _%>