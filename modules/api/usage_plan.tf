resource "aws_api_gateway_usage_plan" "usage_plan" {
  name        = var.name
  description = "Api Usage Plan"

  api_stages {
    api_id = aws_api_gateway_rest_api.api.id
    stage  = aws_api_gateway_stage.stage_api.stage_name
  }
}

