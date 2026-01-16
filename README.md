# terraform-modules
This repository contains modules for terraform resources, these can be used for the given providers. This repo is more or less a reusable repository, open for all


Steps to Get Started:
In this example we are setting up our local environment and also executing a sample code.

1. Install terraform

2. Install terragrunt

3. Update the line 5 in provider_config.hcl, i.e. the kubernetes context : 
"kubernetes_config_context = "docker-desktop" --> the name of your current cluster.

Note: We assume, there is laready a context configured in your local machine, if not please abort. Configure your context and then start from here.

4. Navigate to the directory : terraform-modules/terragrunt/region/environments/dev/

5. Select a module which you want to deploy for e.g namespaces, cd namespaces

6. terragrunt init

7. terragrunt plan

8. terragrunt apply
