variable "s3_buckets" {
  description = "Map of S3 bucket names and their configurations"
  type = map(object({
    versioning   = bool
    object_lock  = bool
  }))
}
