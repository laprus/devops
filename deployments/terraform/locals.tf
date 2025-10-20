locals {
  resource_suffix = var.deploy_as_feature_branch ? "-${var.branch_hash}" : ""
  bucket_name     = "cin-devops-${var.stack_environment}${local.resource_suffix}-8.x.3"
}
