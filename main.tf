terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }  
  backend "s3" {
    bucket = "ter-tfstatebucket"
    key    = "ter-tfstatebucket/statefile"
    dynamodb_table = "state"
    region = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

