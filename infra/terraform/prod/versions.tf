terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Bucket is created by ../bootstrap. use_lockfile = native S3 locking, no DynamoDB table.
  backend "s3" {
    bucket       = "app-tfstate-426737295553-use1"
    key          = "prod/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = { project = "full-app-eks", env = "prod", managed-by = "terraform" }
  }
}
