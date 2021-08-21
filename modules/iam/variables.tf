variable "cluster_oidc_provider" {
  type        = string
  description = "OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster"
}

variable "k8s_namespace" {
  type        = string
  description = "Name of a namespace which will be created for deploying the resources"
  default     = "external-secrets"
}

variable "k8s_sa_name" {
  type        = string
  description = "Name of the Kubernetes service account for external-secrets"
  default     = "external-secrets"
}

variable "iam_role_name" {
  type        = string
  description = "Name of the IAM role used by the Kubernetes service account"
  default     = "external-secrets"
}

variable "secret_names" {
  type        = list(string)
  description = "List of friendly names of the allowed secrets"
}
