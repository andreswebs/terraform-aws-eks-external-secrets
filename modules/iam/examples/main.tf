module "external_secrets_iam" {
  source                = "github.com/andreswebs/terraform-aws-eks-external-secrets//modules/iam"
  cluster_oidc_provider = var.eks_cluster_oidc_provider
  iam_role_name         = "external-secrets-${var.eks_cluster_id}"
  secret_names = [
    "password",
    "token",
    "etc"
  ]
}
