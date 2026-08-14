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
  description = "Kubernetes namespace where cert-manager is deployed"
  type        = string
  default     = "cert-manager"
}

variable "service_account_name" {
  description = "Kubernetes service account used by cert-manager"
  type        = string
  default     = "cert-manager"
}

variable "route53_zone_arns" {
  description = "Route53 hosted zone ARNs cert-manager may use for DNS01 challenges"
  type        = list(string)
  default     = ["*"]
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default     = {}
}
