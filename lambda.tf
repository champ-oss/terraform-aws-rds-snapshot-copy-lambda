

module "rds_snapshot_copy_lambda" {
  source              = "github.com/champ-oss/terraform-aws-lambda.git?ref=v1.0.141-e8ebe65"
  git                 = var.git
  name                = "rds-snapshot-copy-${random_string.identifier.result}"
  tags                = merge(local.tags, var.tags)
  description         = "rds-snapshot-copy lambda function"
  enable_cw_event     = var.enable_lambda_cw_event
  schedule_expression = var.schedule_expression
  enable_vpc          = true
  private_subnet_ids  = var.private_subnet_ids
  sync_image          = true
  sync_source_repo    = "champtitles/rds-snapshot-copy"
  ecr_name            = "rds-snapshot-copy-${random_string.identifier.result}"
  ecr_tag             = var.rds_snapshot_copy_docker_tag
  timeout             = var.timeout
  vpc_id              = var.vpc_id # eni delete resource bug https://github.com/hashicorp/terraform-provider-aws/issues/10329
  environment = {
    KMS_KEY_ID = var.kms_key_id
  }
}