resource "aws_iam_role" "source" {
  provider = aws
  name     = "this_source_s3_sync_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "datasync.amazonaws.com"
        }
      }
    ]
  })

  managed_policy_arns = [aws_iam_policy.source.arn]
}

resource "aws_iam_policy" "source" {
  provider = aws
  name     = "this_source_s3_sync_policy"
  policy   = <<EOF
{
  	"Version": "2012-10-17",
  	"Statement": [{
  			"Effect": "Allow",
  			"Action": [
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:AbortMultipartUpload",
          "s3:DeleteObject",
          "s3:GetObject",
          "s3:ListMultipartUploadParts",
          "s3:PutObjectTagging",
          "s3:GetObjectTagging",
          "s3:PutObject"
  			],
  			"Resource": [
  				"arn:aws:s3:::oredko_src_bucket",
  				"arn:aws:s3:::oredko_src_bucket/*"
  			]
  		},
  		{
  			"Sid": "allowalldatasync",
  			"Effect": "Allow",
  			"Action": [
  				"datasync:*"
  			],
  			"Resource": "*"
  		}
  	]
}
EOF
}