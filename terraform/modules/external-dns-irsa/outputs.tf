output "iam_role_arn" {
  description = "ARN of the IAM role used by ExternalDNS"
  value       = aws_iam_role.external_dns.arn
}

output "iam_role_name" {
  description = "Name of the IAM role used by ExternalDNS"
  value       = aws_iam_role.external_dns.name
}

output "iam_policy_arn" {
  description = "ARN of the IAM policy attached to the ExternalDNS role"
  value       = aws_iam_policy.external_dns.arn
}
