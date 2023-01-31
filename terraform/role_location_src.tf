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
          "s3:*"
  			],
  			"Resource": [
  				"arn:aws:s3:::oredko-src-bucket",
  				"arn:aws:s3:::oredko-src-bucket/*"
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