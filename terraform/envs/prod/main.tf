terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# VPC (FOUNDATION)
module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

# EKS (PLATFORM)
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "aegisops-prod"
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true
 
  create_cloudwatch_log_group = false

  eks_managed_node_groups = {
    default = {
      min_size       = 2
      max_size       = 5
      desired_size   = 3
      instance_types = ["m6i.large"]
    }
  }
}

