module "api" {
  source = "./modules/api"

  # general
  name              = var.name
  stage_variables   = var.api_stage_variables
  lambda_invoke_arn = module.app.lambda_invoke_arn
}

module "app" {
  source = "./modules/lambda"

  # general
  name           = var.name
  aws_region     = var.aws_region
  account_id     = var.account_id
  api_id         = module.api.api_id
  api_resource   = module.api.api_resource
}
