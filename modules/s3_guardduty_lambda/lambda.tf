resource "aws_lambda_function" "guardduty_lambda" {
  function_name = "guardduty-s3-trigger"
  runtime       = "python3.8"
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.lambda_exec_role.arn

  filename      = var.lambda_zip_file  # Use variable for the zip file path

  source_code_hash = filebase64sha256(var.lambda_zip_file)  # Use variable for the source code hash
  environment {
    variables = {
      S3_BUCKET = aws_s3_bucket.bucket.bucket
    }
  }
}
