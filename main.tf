terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
    }
  }
   
  backend "s3" {
    bucket = "dev-cluster-iac"
    key    = "new/statefile"
    # dynamodb_table = "Dynamo"
    region = "me-central-1"
    encrypt        = true
    profile = "default"
  }
}

provider "aws" {
  shared_credentials_files = ["C:/Users/91831/.aws/credentials"]
  profile                 = "default"
}



