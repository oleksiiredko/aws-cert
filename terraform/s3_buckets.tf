# Source bucket
resource "aws_s3_bucket" "private_bucket_src" {
  bucket = "oredko-src-bucket"
}
resource "aws_s3_bucket_acl" "bucket_acl_src" {
  bucket = aws_s3_bucket.private_bucket_src.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "bucket_versioning_src" {
  bucket = aws_s3_bucket.private_bucket_src.id
  versioning_configuration {
    status = "Disabled"
  }
}

# Destination bucket
resource "aws_s3_bucket" "private_bucket_dst" {
  bucket = "oredko-dst-bucket"
}

resource "aws_s3_bucket_acl" "bucket_dst" {
  bucket = aws_s3_bucket.private_bucket_dst.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "bucket_versioning_dst" {
  bucket = aws_s3_bucket.private_bucket_dst.id
  versioning_configuration {
    status = "Disabled"
  }
}

