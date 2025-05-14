provider "aws" {
  region = var.aws_region
}

module "logstorage" {
  source      = "./modules/logstorage"
  bucket_name = var.log_bucket_name
}

module "backstorage" {
  source      = "./modules/backstorage"
  bucket_name = var.backup_bucket_name
}
