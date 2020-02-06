resource "aws_api_gateway_rest_api" "api" {
  name                     = var.name
  description              = "API Gateway"
  minimum_compression_size = "256"
  binary_media_types       = ["image/png", "image/jpeg"]

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}