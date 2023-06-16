terraform {
  required_providers {
<<<<<<< HEAD:generators/app/templates/eks-web-ui/provider.tf
<%_ if (minikube == "false") { _%>
    aws = {
      source = "hashicorp/aws"
    }
<%_ } _%>
=======
>>>>>>> 92ab2c638720281a94f5872946fd4fb5c45237c6:generators/app/templates/k8s-web-ui/provider.tf
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.17.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
<<<<<<< HEAD:generators/app/templates/eks-web-ui/provider.tf
}

<%_ if (minikube == "false") { _%>
provider "aws" {
  region     = var.region
}
<%_ } _%>
=======
}
>>>>>>> 92ab2c638720281a94f5872946fd4fb5c45237c6:generators/app/templates/k8s-web-ui/provider.tf
