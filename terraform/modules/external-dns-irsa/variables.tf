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
  description = "Kubernetes namespace where ExternalDNS is deployed"
  type        = string
  default     = "external-dns"
}

variable "service_account_name" {
  description = "Kubernetes service account used by ExternalDNS"
  type        = string
  default     = "external-dns"
}

variable "route53_zone_arns" {
  description = "List of Route53 hosted zone ARNs that ExternalDNS is allowed to manage"
  type        = list(string)
  default     = ["*"]
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default     = {}
}
