resource "aws_api_gateway_resource" "r_search" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "search"
}

resource "aws_api_gateway_method" "search_GET" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.r_search.id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = "false"

  request_parameters = {
    "method.request.querystring.q" = true
  }
}

resource "aws_api_gateway_method_response" "search_GET_response_200" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.r_search.id
  http_method = aws_api_gateway_method.search_GET.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration" "search_GET_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.r_search.id
  http_method             = aws_api_gateway_method.search_GET.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = var.lambda_invoke_arn

  request_templates = {                  
   "application/json" =  <<REQUEST_TEMPLATE
   {
    "q": "$input.params('q')"
   }
   REQUEST_TEMPLATE
 }
}

resource "aws_api_gateway_integration_response" "search_GET_integration_response" {
    rest_api_id   = "${aws_api_gateway_rest_api.api.id}"
    resource_id   = "${aws_api_gateway_resource.r_search.id}"
    http_method   = "${aws_api_gateway_integration.search_GET_integration.http_method}"
    status_code   = "${aws_api_gateway_method_response.search_GET_response_200.status_code}"
}