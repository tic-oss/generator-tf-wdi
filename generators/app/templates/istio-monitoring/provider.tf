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

terraform {
 required_providers {
<%_ if (cloudProvider == "aws") { _%>
  aws = {
   source = "hashicorp/aws"
  }
<%_ } _%>
<%_ if (cloudProvider == "azure") { _%>
   azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.0"
    }
<%_ } _%>
 }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
