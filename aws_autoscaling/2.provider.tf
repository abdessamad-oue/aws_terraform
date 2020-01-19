# AWS Provider
provider "aws" {
    region = "eu-west-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "ao_admin"

}
