variable "s3_config" {
  description = "Configuration for the S3 bucket"
  type = object({
    bucket_name        = string
    acl                = string
    versioning_enabled = bool
    tags               = map(string)
  })
}
