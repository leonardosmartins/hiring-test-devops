module "api" {
  source = "./modules/api"

  name              = var.name
  lambda_invoke_arn = module.app.lambda_invoke_arn
}

module "app" {
  source = "./modules/lambda"

  name           = var.name
  aws_region     = var.aws_region
  account_id     = var.account_id
  api_id         = module.api.api_id
  api_resource   = module.api.api_resource
}
