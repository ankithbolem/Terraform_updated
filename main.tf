provider "aws" {
  region = "us-west-2"
}


variable "lambda_zip_file" {
  description = "Path to the Lambda zip file"
  type        = string
}

module "s3_guardduty_lambda" {
  source          = "./modules/s3_guardduty_lambda"
  s3_bucket_name  = "my-guardduty-s3-bucket"
  lambda_zip_file = var.lambda_zip_file  # Use the variable
}
