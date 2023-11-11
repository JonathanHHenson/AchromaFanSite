resource "aws_iam_policy" "landing_crud" {
  name        = "landing_crud"
  description = "Landing CRUD policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
        ]
        Resource = [
          aws_s3_bucket.achroma_db_landing.arn,
          "${aws_s3_bucket.achroma_db_landing.arn}/*",
        ]
      },
    ]
  })
}