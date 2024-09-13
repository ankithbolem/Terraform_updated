variable "s3_bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}


variable "lambda_zip_file" {
  description = "Path to the Lambda zip file"
  type        = string
  default     = ""  # Empty default value
}
