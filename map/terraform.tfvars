s3_buckets = {
  bucket1-unique-name1 = {
    versioning  = true
    object_lock = true
  }
  bucket2-unique-name2 = {
    versioning  = false
    object_lock = true
  }
  bucket3-unique-name33 = {
    versioning  = true
    object_lock = false
  }
}
