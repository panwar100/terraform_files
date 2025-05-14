s3_config = {
  bucket_name        = "ritik-devops-demo-bucket2025"
  acl                = "private"
  versioning_enabled = true
  tags = {
    Environment = "Dev"
    Project     = "Terraform-S3"
    Owner       = "Ritik"
  }
}
