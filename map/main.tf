provider "aws" {
  region = "us-east-1"
}

# Create the S3 buckets
resource "aws_s3_bucket" "multi_buckets" {
  for_each = var.s3_buckets

  bucket = each.key

  # This MUST be a boolean — true or false
  object_lock_enabled = each.value.object_lock
}

# Enable versioning using the separate recommended resource
resource "aws_s3_bucket_versioning" "versioning" {
  for_each = {
    for k, v in var.s3_buckets : k => v
    if v.versioning
  }

  bucket = aws_s3_bucket.multi_buckets[each.key].id

  versioning_configuration {
    status = "Enabled"
  }
}

# Configure object lock rules if requested
resource "aws_s3_bucket_object_lock_configuration" "lock" {
  for_each = {
    for k, v in var.s3_buckets : k => v
    if v.object_lock
  }

  bucket = aws_s3_bucket.multi_buckets[each.key].id

  rule {
    default_retention {
      mode = "GOVERNANCE"
      days = 1
    }
  }
}
