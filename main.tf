terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }  
  backend "s3" {
    bucket = "akhil-matson"
    key    = "statefile"
    dynamodb_table = "Dynamo"
    region = "ap-south-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

