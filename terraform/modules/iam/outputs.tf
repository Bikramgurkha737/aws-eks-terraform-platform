output "cluster_role_arn" {
  description = "IAM role ARN for the EKS control plane"
  value       = aws_iam_role.eks_cluster.arn
}

output "node_role_arn" {
  description = "IAM role ARN for the EKS worker nodes"
  value       = aws_iam_role.eks_nodes.arn
}