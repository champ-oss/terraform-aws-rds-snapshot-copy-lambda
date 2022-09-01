variable "private_subnet_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group#subnet_ids"
  type        = list(string)
}

variable "vpc_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id"
  type        = string
}

variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-mysql"
}

variable "enable_lambda_cw_event" {
  description = "enable or disable cloudwatch event trigger for lambda"
  default     = true
  type        = bool
}

variable "schedule_expression" {
  description = "event schedule for lambda"
  type        = string
  default     = "cron(30 10 * * ? *)" # lambda executes every day at 10:30am UTC
}

variable "rds_snapshot_copy_docker_tag" {
  description = "Docker tag of rds snapshot share code to deploy"
  type        = string
  default     = "2026720c06b88e2cd963ad3f8db5a54c414fd08f"
}

variable "timeout" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function#timeout"
  type        = number
  default     = 300
}

variable "lambda_policy" {
  type        = any
  description = "point to data.aws_iam_policy_document.custom.json"
  default     = null
}