#Environments:
variable "name" {}

variable "stage_variables" {
  type = map(string)
}

variable "lambda_invoke_arn" {}
