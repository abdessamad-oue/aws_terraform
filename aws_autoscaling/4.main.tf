
resource "aws_s3_bucket" "my_bucket" {
  bucket = "ao-test-s3-bucket-mfa"
  acl    = "private"

  versioning = {
      enabled       = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

}