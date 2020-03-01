variable function_payload {
  default = "../athena-api/athena-api.zip"
}

resource "aws_lambda_function" "athena_api_lambda" {
  filename      = var.function_payload
  function_name = "athena_api"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "app.lambdaHandler"

  source_code_hash = filebase64sha256(var.function_payload)

  runtime = "nodejs12.x"

  timeout = 60
}
