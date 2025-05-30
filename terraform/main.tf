module "argocd" {
  source                 = "../modules/argocd"
  argocd_private_key     = var.argocd_private_key
  helm_chart_private_key = var.helm_chart_private_key
}
