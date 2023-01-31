
# # Source Bucket Inline Policy
# resource "aws_s3_bucket_policy" "allow_access_src_from_datasync_service" {
#   bucket = aws_s3_bucket.private_bucket_src.id
#   policy = data.aws_iam_policy_document.allow_access_src_from_another_account.json
# }

# data "aws_iam_policy_document" "allow_access_src_from_another_account" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::320456273714:role/this_source_s3_sync_role"]
#     }

#     actions = [
#       "s3:*"
#     ]

#     resources = [
#       aws_s3_bucket.private_bucket_src.arn,
#       "${aws_s3_bucket.private_bucket_src.arn}/*",
#     ]
#   }
# }

# # Destibation Bucket Inline Policy
# resource "aws_s3_bucket_policy" "allow_access_dst_bckt_from_datasync_service" {
#   bucket = aws_s3_bucket.private_bucket_dst.id
#   policy = data.aws_iam_policy_document.allow_access_dst_from_datasync_service.json
# }

# data "aws_iam_policy_document" "allow_access_dst_from_datasync_service" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::320456273714:role/this_destination_s3_sync_role"]
#     }

#     actions = [
#       "s3:*"
#     ]

#     resources = [
#       aws_s3_bucket.private_bucket_dst.arn,
#       "${aws_s3_bucket.private_bucket_dst.arn}/*",
#     ]
#   }
# }