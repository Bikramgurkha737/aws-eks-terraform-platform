output "iam_role_arn" {
  description = "ARN of the IAM role used by cert-manager"
  value       = aws_iam_role.cert_manager.arn
}

output "iam_role_name" {
  description = "Name of the IAM role used by cert-manager"
  value       = aws_iam_role.cert_manager.name
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy attached to the cert-manager role"
  value       = aws_iam_policy.cert_manager.arn
}
