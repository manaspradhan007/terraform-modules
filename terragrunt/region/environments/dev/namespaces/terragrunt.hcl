include "root" {
  path   = find_in_parent_folders("provider_config.hcl")
  expose = true
}

locals {
  env_vars    = read_terragrunt_config("../../env.hcl")
  region_vars = read_terragrunt_config("../../../region.hcl")
}

terraform {
  source = "${get_repo_root()}//modules/namespace-modules"
}

inputs = {
  tags = {
    created-by  = "terragrunt-code"
    environment = "${local.env_vars.locals.dev_environment}"
    region      = "${local.region_vars.locals.region}"
  }

  #namespace:
  kubernetes_namespaces = ["nginx","test1","test2"]
}