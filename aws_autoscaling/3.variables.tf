# variables 
variable "server_port" {
    default = 8080,
    description = "The port the server will use for HTTP requests"
}

variable "s3_bucket_state" {
    default = "oue-terraform-remote-state-storage"
}
