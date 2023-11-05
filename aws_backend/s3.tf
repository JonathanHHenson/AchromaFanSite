resource "aws_s3_bucket" "achroma_db_landing" {
  bucket = "achroma-db-landing-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name = "Achroma DB Landing Bucket"
  }
}

resource "aws_s3_bucket" "achroma_db_queryoutput" {
  bucket = "achroma-db-queryoutput-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name = "Achroma DB Query Output Bucket"
  }
}
