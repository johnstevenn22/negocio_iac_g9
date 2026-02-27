resource "aws_cloudwatch_log_group" "api_gateway_logs" {
  name              = "/aws/apigateway/${var.project_name}"
  retention_in_days = 365
  kms_key_id        = aws_kms_key.main.arn

  tags = {
    Name        = "${var.project_name}-apigw-logs"
    Environment = var.environment
  }
}

resource "aws_apigatewayv2_api" "http_api" {
  name          = "${var.project_name}-api-gateway"
  protocol_type = "HTTP"

  tags = {
    Name        = "${var.project_name}-api-gateway"
    Environment = var.environment
  }
}