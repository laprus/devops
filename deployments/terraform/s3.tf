# All S3 buckets required TLS, the easiest way to configure correctly S3 is to use module.
module "s3_blueprint" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.3.0"

  bucket = local.bucket_name
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_policy" "https_only_policy" {
  bucket = module.s3_blueprint.s3_bucket_id
  policy = data.aws_iam_policy_document.https_only_policy.json
}

data "aws_iam_policy_document" "https_only_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    effect = "Deny"

    actions = [
      "s3:*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }

    resources = [
      module.s3_blueprint.s3_bucket_arn,
      "${module.s3_blueprint.s3_bucket_arn}/*"
    ]
  }
}
