resource "aws_s3_bucket_policy" "destination_example" {
  provider = aws.destination
  bucket   = aws_s3_bucket.private_bucket_dst.id
  policy   = <<POLICY
{
          "Version": "2008-10-17",
          "Statement": [
              {
                  "Sid": "bucket",
                  "Effect": "Allow",
                  "Principal": {
                      "AWS":  [
                        "${aws_iam_role.destination.arn}",
                        "${aws_iam_role.source.arn}",
                        "${data.aws_caller_identity.destination.arn}"
                      ]
                  },
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
                    "s3:PutObject",
                    "s3:*"
                  ],
                  "Resource": [
                    "${aws_s3_bucket.private_bucket_dst.arn}",
                    "${aws_s3_bucket.private_bucket_dst.arn}/*"
                  ]
              },
              {
                  "Sid": "terraform",
                  "Effect": "Allow",
                  "Principal": {
                      "AWS":  [
                        "${data.aws_caller_identity.destination.arn}",
                        "${data.aws_caller_identity.source.arn}"
                      ]
                  },
                  "Action": [
                    "s3:ListBucket",
                    "s3:*"
                  ],
                  "Resource": [
                    "${aws_s3_bucket.private_bucket_dst.arn}",
                    "${aws_s3_bucket.private_bucket_dst.arn}/*"
                  ]
              }
          ]
}
POLICY
}