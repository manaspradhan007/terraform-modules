module "namespace" {
  source                = "../../resource-modules/namespaces"
  kubernetes_namespaces = var.kubernetes_namespaces
  tags                  = var.tags
}