locals {
  oidc_provider = replace(
    var.cluster_oidc_issuer_url,
    "https://",
    ""
  )

  service_account_subject = "system:serviceaccount:${var.namespace}:${var.service_account_name}"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    sid     = "AllowAssumeRoleWithWebIdentity"
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type = "Federated"

      identifiers = [
        var.cluster_oidc_provider_arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:sub"

      values = [
        local.service_account_subject
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "controller" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(
    var.tags,
    {
      Name      = var.role_name
      Component = "aws-load-balancer-controller"
      Cluster   = var.cluster_name
      ManagedBy = "Terraform"
    }
  )
}

resource "aws_iam_policy" "controller" {
  name        = var.policy_name
  description = "IAM permissions for the AWS Load Balancer Controller"
  policy      = file("${path.module}/iam-policy.json")

  tags = merge(
    var.tags,
    {
      Name      = var.policy_name
      Component = "aws-load-balancer-controller"
      Cluster   = var.cluster_name
      ManagedBy = "Terraform"
    }
  )
}

resource "aws_iam_role_policy_attachment" "controller" {
  role       = aws_iam_role.controller.name
  policy_arn = aws_iam_policy.controller.arn
}