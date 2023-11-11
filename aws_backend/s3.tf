resource "aws_s3_bucket" "achroma_db_landing" {
  bucket = "achroma-db-landing-${data.aws_caller_identity.current.account_id}"

  tags = var.tags
}

resource "aws_s3_bucket" "achroma_db_staging" {
  bucket = "achroma-db-staging-${data.aws_caller_identity.current.account_id}"

  tags = var.tags
}
