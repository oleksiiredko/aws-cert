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
resource "aws_s3_object" "folder_src" {
  bucket = aws_s3_bucket.private_bucket_src.id
  key    = "src/"
}

# Destination bucket
resource "aws_s3_bucket" "private_bucket_dst" {
  provider = aws.destination 
  bucket   = "denis-dst-bucket"
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
resource "aws_s3_object" "folder_dst" {
  bucket = aws_s3_bucket.private_bucket_dst.id
  key    = "dst/"
}