terraform {
  required_providers {
    aws = {
     source  = "hashicorp/aws"
     version = "~> 3.0"
   }
  }

  backend "s3" {
    bucket = "kalyand14-terraform-state-bucket"
    key = "state/terraform_state.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}