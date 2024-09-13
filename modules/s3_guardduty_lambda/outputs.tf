output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "lambda_function_name" {
  value = aws_lambda_function.guardduty_lambda.function_name
}
