data "terraform_remote_state" "bucket" {
  backend = "s3"

  config = {
     bucket = "oue-terraform-remote-state-storage"
     key    = "terraform.tfstate"
     region = "eu-west-1"
  }
}


resource "aws_s3_bucket_object" "object" {
  bucket = "${data.terraform_remote_state.bucket.bucket_name}"
  key    = "fichier.txt"
  source = "./fichier.txt"

  etag = "${filemd5("./fichier.txt")}"
}