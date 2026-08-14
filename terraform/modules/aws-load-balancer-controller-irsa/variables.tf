variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "cluster_oidc_provider_arn" {
  description = "ARN of the IAM OIDC provider associated with the EKS cluster."
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster."
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace for the AWS Load Balancer Controller."
  type        = string
  default     = "kube-system"
}

variable "service_account_name" {
  description = "Kubernetes service account used by the AWS Load Balancer Controller."
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "role_name" {
  description = "IAM role name for the AWS Load Balancer Controller."
  type        = string
  default     = "AWSLoadBalancerControllerRole"
}

variable "policy_name" {
  description = "IAM policy name for the AWS Load Balancer Controller."
  type        = string
  default     = "AWSLoadBalancerControllerIAMPolicy"
}

variable "tags" {
  description = "Tags applied to AWS resources."
  type        = map(string)
  default     = {}
}