terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.deployment_info.region
  default_tags {
    tags = {
      "Project"     = var.deployment_info.project_name
      "Environment" = var.deployment_info.environment
    }
  }
}
