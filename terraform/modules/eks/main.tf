module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  manage_aws_auth_configmap = var.manage_aws_auth_configmap
  aws_auth_users            = var.aws_auth_users

  eks_managed_node_groups = {
    default = {
      min_size       = 2
      max_size       = 5
      desired_size   = 3
      instance_types = ["m6i.large"]
    }
  }
}

