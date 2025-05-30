variable "argocd_private_key" {
  description = "SSH private key for argocd-app-of-apps repository"
  sensitive   = true
  type        = string
}

variable "helm_chart_private_key" {
  description = "SSH private key for helm-charts repository"
  sensitive   = true
  type        = string
}
