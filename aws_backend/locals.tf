locals {
  account_id = data.aws_caller_identity.current.account_id
  resource_suffix = "${var.deployment_info.project_name}-${var.deployment_info.environment}-${local.account_id}"
}
