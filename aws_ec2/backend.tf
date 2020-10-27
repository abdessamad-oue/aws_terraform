terraform {
  backend "s3" {
    encrypt        = "true"
    bucket         = "abde-terraform-remote-state-storage"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-locks"
    region         = "eu-west-1"
  }
}