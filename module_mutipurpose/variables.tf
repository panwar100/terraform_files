variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "log_bucket_name" {
  description = "Name for the log S3 bucket"
  type        = string
  default     = "ritik-log-bucket-example"
}

variable "backup_bucket_name" {
  description = "Name for the backup S3 bucket"
  type        = string
  default     = "ritik-backup-bucket-example"
}
