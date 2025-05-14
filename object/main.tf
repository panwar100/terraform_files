provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "this" {
  bucket = var.s3_config.bucket_name
  acl    = var.s3_config.acl

  tags = var.s3_config.tags

  versioning {
    enabled = var.s3_config.versioning_enabled
  }
}
