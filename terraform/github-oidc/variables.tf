variable "aws_region" {
  description = "AWS region used by the GitHub Actions IAM role"
  type        = string
  default     = "us-east-1"
}

variable "github_repository" {
  description = "GitHub repository allowed to assume the AWS IAM role"
  type        = string
  default     = "Bikramgurkha737/aws-eks-terraform-platform"
}

variable "github_oidc_role_name" {
  description = "IAM role assumed by GitHub Actions using OIDC"
  type        = string
  default     = "github-actions-terraform-role"
}

variable "terraform_state_bucket" {
  description = "Terraform remote state S3 bucket name"
  type        = string
  default     = "REPLACE-WITH-YOUR-TERRAFORM-STATE-BUCKET"
}

variable "terraform_state_kms_key_arn" {
  description = "KMS key ARN used to encrypt Terraform state"
  type        = string
  default     = "arn:aws:kms:us-east-1:ACCOUNT-ID:key/REPLACE-WITH-KMS-KEY-ID"
}