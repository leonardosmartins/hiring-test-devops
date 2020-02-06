terraform {
  backend "s3" {
    bucket = "leozim-poc"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
