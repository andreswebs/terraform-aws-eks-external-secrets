/**
* Deploys IAM resources for external-secrets
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.48.0"
    }

  }
}

locals {
  iam_role_name = var.iam_role_name == "" ? null : var.iam_role_name
}

module "assume_role_policy" {
  source                = "andreswebs/eks-irsa-policy-document/aws"
  version               = "1.0.0"
  cluster_oidc_provider = var.cluster_oidc_provider
  k8s_sa_name           = var.k8s_sa_name
  k8s_sa_namespace      = var.k8s_namespace
}

resource "aws_iam_role" "this" {
  name                  = local.iam_role_name
  assume_role_policy    = module.assume_role_policy.json
  force_detach_policies = true
}

module "secrets_access" {
  source       = "andreswebs/secrets-access-policy-document/aws"
  version      = "1.0.0"
  secret_names = var.secret_names
}

resource "aws_iam_role_policy" "this" {
  name   = "external-secrets-permissions"
  role   = aws_iam_role.this.id
  policy = module.secrets_access.json
}
