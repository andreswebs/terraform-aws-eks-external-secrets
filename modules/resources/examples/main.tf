module "external_secrets_resources" {
  source                         = "github.com/andreswebs/terraform-aws-eks-external-secrets//modules/resources"
  iam_role_arn                   = var.iam_role_arn
  chart_version_external_secrets = var.chart_version_external_secrets
}