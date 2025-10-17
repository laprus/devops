provider "aws" {
  region = var.aws_region

  assume_role_with_web_identity {
    role_arn                = var.aws_role_arn
    web_identity_token_file = "/mnt/workspace/spacelift.oidc"
  }

  default_tags {
    tags = local.aws_tags
  }
}