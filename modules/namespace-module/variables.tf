variable "tags" {
  description = "tags"
  type        = map(string)
}
variable "kubernetes_namespaces" {
  type = list(string)
}