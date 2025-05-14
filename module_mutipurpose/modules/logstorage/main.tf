resource "aws_s3_bucket" "log_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Log Storage"
    Environment = "Dev"
  }
}

variable "bucket_name" {
  description = "The name of the log S3 bucket"
  type        = string
}
