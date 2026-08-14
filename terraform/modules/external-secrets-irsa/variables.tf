variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the IAM OIDC provider associated with the EKS cluster"
  type        = string
}

variable "oidc_provider_url" {
  description = "URL of the IAM OIDC provider associated with the EKS cluster"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace where External Secrets Operator is deployed"
  type        = string
  default     = "external-secrets"
}

variable "service_account_name" {
  description = "Kubernetes service account used by External Secrets Operator"
  type        = string
  default     = "external-secrets"
}

variable "secret_arns" {
  description = "AWS Secrets Manager secret ARNs that External Secrets Operator may read"
  type        = list(string)
}

variable "kms_key_arns" {
  description = "Optional KMS key ARNs used to decrypt Secrets Manager secrets"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default     = {}
}
