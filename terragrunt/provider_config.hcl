locals {
  env_vars                  = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  region_vars               = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  config_vars               = read_terragrunt_config(find_in_parent_folders("config.hcl"))
  kubernetes_config_context = "task-cluster"
}


generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "~> 1.11.1"
  required_providers {
    ionoscloud = {
      source = "ionos-cloud/ionoscloud"
      version = "6.7.7"
    }
    kubernetes = {
       source  = "hashicorp/kubernetes"
       version = "~> 2"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">=3.0.2"
    }
  }
}
provider "kubernetes" {
  config_context = "${local.kubernetes_config_context}"
  config_path    = "~/.kube/config"
}
provider "helm" {
  kubernetes = {
    config_path    = "~/.kube/config"
  }
}
EOF
}
inputs = merge(
  local.env_vars.locals,
  local.config_vars.locals
)