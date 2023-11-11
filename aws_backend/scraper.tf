data "aws_iam_policy_document" "scraper_agent_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "scraper_agent" {
  statement {
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.achroma_db_landing.arn,
      "${aws_s3_bucket.achroma_db_landing.arn}/*",
    ]
  }
}

resource "aws_iam_role" "scraper_agent" {
  name               = "scraper-agent-${local.resource_suffix}"
  assume_role_policy = data.aws_iam_policy_document.scraper_agent_assume_role.json
  inline_policy {
    name   = "scraper-agent-${local.resource_suffix}"
    policy = data.aws_iam_policy_document.scraper_agent.json
  }
}

resource "aws_lambda_function" "scraper_agent" {
  function_name = "scraper-agent-${local.resource_suffix}"
  role          = aws_iam_role.scraper_agent.arn

  runtime   = "python3.11"
  handler   = "scraper_agent.lambda_handler"
  filename  = "${var.code_artefacts_path}/scraper_agent.zip"
}
