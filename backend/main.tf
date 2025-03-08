provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "unique-example-bucket-12345"

  tags = {
    Name        = "terraform_remote_state_EKS_dynamoDB"
    Environment = "Dev"
  }

  lifecycle {
    prevent_destroy = false
  }
}


resource "aws_dynamodb_table" "My-table" {
  name         = "demo-terraform-eks-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }
}
