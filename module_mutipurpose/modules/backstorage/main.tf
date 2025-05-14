resource "aws_s3_bucket" "backup_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Backup Storage"
    Environment = "Dev"
  }
}

variable "bucket_name" {
  description = "The name of the backup S3 bucket"
  type        = string
}
