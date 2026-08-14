output "iam_role_arn" {
  description = "ARN of the IAM role used by External Secrets Operator"
  value       = aws_iam_role.external_secrets.arn
}

output "iam_role_name" {
  description = "Name of the IAM role used by External Secrets Operator"
  value       = aws_iam_role.external_secrets.name
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy attached to the External Secrets Operator role"
  value       = aws_iam_policy.external_secrets.arn
}
