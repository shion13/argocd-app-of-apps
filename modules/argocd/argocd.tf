terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.37.1"
    }
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "8.0.10"

}

resource "kubernetes_manifest" "app_of_apps_argo_repo" {
  manifest   = yamldecode(templatefile("${path.module}/app-of-apps-argo-repo.yaml", {argocd_private_key=indent(4, file("~/.ssh/argocd_ssh"))}))
  depends_on = [helm_release.argocd]
}

resource "kubernetes_manifest" "app_of_apps_helm_repo" {
  manifest   = yamldecode(templatefile("${path.module}/app-of-apps-helm-repo.yaml", {helm_chart_private_key=indent(4, file("~/.ssh/helm_ssh"))}))
  depends_on = [helm_release.argocd]
}

resource "kubernetes_manifest" "argocd_init_namespace" {
  manifest   = yamldecode(file("${path.module}/namespace.yaml"))
  depends_on = [helm_release.argocd]
}

resource "kubernetes_manifest" "app_of_apps" {
  manifest   = yamldecode(file("${path.module}/application.yaml"))
  depends_on = [kubernetes_manifest.argocd_init_namespace, kubernetes_manifest.app_of_apps_argo_repo, kubernetes_manifest.app_of_apps_helm_repo]
}
