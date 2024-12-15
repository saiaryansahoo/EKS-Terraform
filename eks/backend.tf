terraform {
  required_version = "~> 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-s2-bucket"
    region         = "ap-southeast-2"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "lock-files-terraform"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws-region
}
