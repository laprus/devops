variable "project" {
  type        = string
  description = "Project name"
  default     = "cin-devops"
}

variable "team" {
  type        = string
  default     = "cin-devops"
  description = "Team name"
}

variable "environment" {
  description = "Name of the environment which is the target of the deployment. Use spacelift context to set this value."
  type        = string
}

variable "aws_region" {
  type        = string
  description = "AWS region where the resources will be deployed. Use spacelift context to set this value."
  default     = "us-east-1"
}

variable "aws_role_arn" {
  description = "ARN of the AWS role to assume. Use spacelift context to set this value."
  type        = string
}

variable "branch_name" {
  type        = string
  description = "The default branch name to use for the stack"
  default     = "main"
}

variable "branch_hash" {
  type        = string
  description = "The branch hash to use as suffix for all resources"
  default     = ""
  validation {
    condition     = !var.deploy_as_feature_branch || length(var.branch_hash) == 4
    error_message = "The branch_hash must be exactly 4 characters when `deploy_as_feature_branch` is true"
  }
}

variable "deploy_as_feature_branch" {
  type        = bool
  description = "If true, the branch_hash will be used as a suffix for all resources"
  default     = false
}