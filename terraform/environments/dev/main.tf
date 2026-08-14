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

# AWS Load Balancer Controller IRSA
module "aws_load_balancer_controller_irsa" {
  source = "../../modules/aws-load-balancer-controller-irsa"

  cluster_name = var.cluster_name

  cluster_oidc_provider_arn = var.aws_load_balancer_controller_oidc_provider_arn
  cluster_oidc_issuer_url   = var.aws_load_balancer_controller_oidc_issuer_url

  namespace            = "kube-system"
  service_account_name = "aws-load-balancer-controller"

  role_name   = "AWSLoadBalancerControllerRole-dev"
  policy_name = "AWSLoadBalancerControllerIAMPolicy-dev"

  tags = {
    Environment = "dev"
    Project     = "aws-eks-terraform-platform"
  }
}