terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # The bucket this stack creates also holds this stack's own state (migrated after first apply).
  backend "s3" {
    bucket       = "app-tfstate-426737295553-use1"
    key          = "bootstrap/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = { project = "full-app-eks", managed-by = "terraform", stack = "bootstrap" }
  }
}
