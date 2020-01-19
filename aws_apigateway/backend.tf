terraform {
  
  backend "s3" {
    encrypt     = "true"
    bucket      = "oue-terraform-remote-state-storage"
    key         = "apigtw.tfstate"
    region      = "eu-west-1"
  }

}