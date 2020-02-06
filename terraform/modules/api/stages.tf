
resource "aws_api_gateway_stage" "stage_api" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.first.id
  stage_name    = "main"
  description   = "Main Stage"

  variables = var.stage_variables

  tags = {
    Name        = var.name
  }

  lifecycle {
    ignore_changes = [deployment_id]
  }
}

resource "aws_api_gateway_method_settings" "general_settings" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = aws_api_gateway_stage.stage_api.stage_name
  method_path = "*/*"

  settings {
    # Enable CloudWatch logging and metrics
    metrics_enabled        = true
    data_trace_enabled     = true
    logging_level          = "INFO"

    # Limit the rate of calls to prevent abuse and unwanted charges
    throttling_rate_limit  = 10000
    throttling_burst_limit = 5000
  }
}

