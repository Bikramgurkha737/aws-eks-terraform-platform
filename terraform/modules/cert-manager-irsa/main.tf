locals {
  oidc_provider = replace(var.oidc_provider_url, "https://", "")
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type = "Federated"

      identifiers = [
        var.oidc_provider_arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:sub"

      values = [
        "system:serviceaccount:${var.namespace}:${var.service_account_name}"
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

resource "aws_iam_role" "cert_manager" {
  name               = "${var.cluster_name}-cert-manager"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-cert-manager"
    }
  )
}

resource "aws_iam_policy" "cert_manager" {
  name        = "${var.cluster_name}-cert-manager"
  description = "IAM policy for cert-manager Route53 DNS01 validation"

  policy = templatefile(
    "${path.module}/iam-policy.json",
    {
      route53_zone_arns = var.route53_zone_arns
    }
  )

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cert_manager" {
  role       = aws_iam_role.cert_manager.name
  policy_arn = aws_iam_policy.cert_manager.arn
}
