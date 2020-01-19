terraform {
  backend "s3" {
    encrypt     = "true"
    bucket      = "oue-terraform-remote-state-storage"
    key         = "terraform.tfstate"
    region      = "eu-west-1"
  }
}