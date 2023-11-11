resource "aws_s3_bucket" "achroma_db_landing" {
  bucket = "achroma-db-landing-${local.resource_suffix}"
}

resource "aws_s3_bucket" "achroma_db_staging" {
  bucket = "achroma-db-staging-${local.resource_suffix}"
}
