resource "aws_datasync_location_s3" "datasync_location_s3_src" {
  #provider = "aws.account1"
  s3_bucket_arn  = aws_s3_bucket.private_bucket_src.arn
  subdirectory   = "/src"

  s3_config {
    bucket_access_role_arn = aws_iam_role.destination.arn
  }
}

resource "aws_datasync_location_s3" "datasync_location_s3_dst" {
  #provider = "aws.account2"
  s3_bucket_arn  = aws_s3_bucket.private_bucket_dst.arn
  subdirectory   = "/dst"

  s3_config {
    bucket_access_role_arn = aws_iam_role.source.arn
  }
}