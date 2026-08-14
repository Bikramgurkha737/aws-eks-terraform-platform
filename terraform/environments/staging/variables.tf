variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "sre-platform-staging"
}

variable "vpc_cidr" {
  description = "VPC CIDR for staging"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "Public subnet 1 CIDR for staging"
  type        = string
  default     = "10.1.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "Public subnet 2 CIDR for staging"
  type        = string
  default     = "10.1.2.0/24"
}

variable "aws_load_balancer_controller_oidc_provider_arn" {
  description = "IAM OIDC provider ARN for AWS Load Balancer Controller IRSA."
  type        = string
  default     = "arn:aws:iam::000000000000:oidc-provider/oidc.eks.placeholder.amazonaws.com/id/PLACEHOLDER"
}

variable "aws_load_balancer_controller_oidc_issuer_url" {
  description = "EKS OIDC issuer URL for AWS Load Balancer Controller IRSA."
  type        = string
  default     = "https://oidc.eks.placeholder.amazonaws.com/id/PLACEHOLDER"
}

variable "route53_zone_arns" {
  description = "Route53 hosted zone ARNs managed by ExternalDNS and cert-manager"
  type        = list(string)
}

variable "external_secrets_secret_arns" {
  description = "AWS Secrets Manager secret ARNs readable by External Secrets Operator"
  type        = list(string)
}
