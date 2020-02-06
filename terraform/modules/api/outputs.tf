output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}

output "api_resource" {
  value = aws_api_gateway_resource.r_search.path
}
