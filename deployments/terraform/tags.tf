locals {
  business_unit = "ai"

  aws_tags = {
    business_unit        = local.business_unit
    team                 = var.team
    env                  = var.environment
    "hxp.environment.id" = "pooled"
    "hxp.account.id"     = "pooled"
    "hxp.app_key"        = "discovery"

    # optional
    terraform   = true
    project     = var.project
    repo_link   = "https://github.com/laprus/devops"
    repo_name   = "cin-devops"
    directory   = "deployments/terraform"
    branch_hash = var.branch_hash
    branch_name = var.branch_name
  }
}
