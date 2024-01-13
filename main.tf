provider "aws" {
  region = "us-west-2"
}

variable "s3_bucket_name" {}
variable "dynamodb_table_name" {}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

resource "aws_dynamodb_table" "my_table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
