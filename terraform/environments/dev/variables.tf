variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "bikram-sre-eks-dev"
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
