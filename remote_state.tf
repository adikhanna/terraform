terraform {
  backend "s3" {
    bucket = "updata-tf-remote-state"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}