resource "aws_iam_policy" "replication_policy" {
  name   = "s3-replication-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetReplicationConfiguration",
          "s3:ListBucket",
          "s3:GetObjectVersion",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionForReplication",
          "s3:GetObjectVersionTagging",
        ]
        Effect = "Allow"
        Resource = [
          module.s3_buckets.primary_bucket_arn,
          "${module.s3_buckets.primary_bucket_arn}/*",
          module.s3_buckets.secondary_bucket_arn,
          "${module.s3_buckets.secondary_bucket_arn}/*"
        ]
      },
      {
        Action = [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags",
          "s3:GetObjectRetention",
          "s3:GetObjectLegalHold",
        ]
        Effect = "Allow"
        Resource = "${module.s3_buckets.secondary_bucket_arn}/*"
      }
    ]
  })
}
