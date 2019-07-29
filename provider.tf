provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "yadhu621-tfstate-aws-vpc"
    key = "aws-vpc"
    region = "eu-west-2" 

  }
}