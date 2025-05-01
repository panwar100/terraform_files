provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
    bucket = var.bucket_name
    acl    = "private"
        tags = {
        
            Name = "mybucket"
            Environment = "Dev"
        }
    }
