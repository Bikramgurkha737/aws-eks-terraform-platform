module "vpc" {
  source = "../../modules/vpc"

  cluster_name = var.cluster_name
}

module "iam" {
  source = "../../modules/iam"

  cluster_name = var.cluster_name
}

module "eks" {
  source = "../../modules/eks"

  cluster_name     = var.cluster_name
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  subnet_ids       = module.vpc.public_subnet_ids

  instance_types = ["t3.small"]

  desired_size = 2
  min_size     = 1
  max_size     = 3
}