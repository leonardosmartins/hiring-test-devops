# Lambda
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:${var.aws_region}:${var.account_id}:${var.api_id}/*/GET${var.api_resource}"
}

resource "aws_lambda_function" "lambda" {
  filename      = "./modules/lambda/app/lambda.zip"
  function_name = var.name
  role          = aws_iam_role.role.arn
  handler       = "lib/index.handler"
  runtime       = "nodejs10.x"
  source_code_hash = "${filebase64sha256("./modules/lambda/app/lambda.zip")}"
}

# IAM
resource "aws_iam_role" "role" {
  name = var.name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}