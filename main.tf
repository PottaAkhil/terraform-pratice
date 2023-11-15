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
  shared_credentials_files = ["C:/Users/Akhil/.aws/credentials"]

  # Use the "Matson" named profile from the AWS CLI credentials file
  profile                 = "Matson"
}
