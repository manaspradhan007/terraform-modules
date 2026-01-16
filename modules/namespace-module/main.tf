module "namespace" {
  source                = "../../resources/namespace"
  kubernetes_namespaces = var.kubernetes_namespaces
  tags                  = var.tags
}