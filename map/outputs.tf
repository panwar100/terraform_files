output "s3_bucket_names" {
  description = "Names of the created S3 buckets"
  value       = [for bucket in aws_s3_bucket.multi_buckets : bucket.bucket]
}

output "s3_bucket_arns" {
  description = "ARNs of the created S3 buckets"
  value       = [for bucket in aws_s3_bucket.multi_buckets : bucket.arn]
}
