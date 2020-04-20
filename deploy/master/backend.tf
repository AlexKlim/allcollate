provider "aws" {
  version    = "~> 2.47"
  region     = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

terraform {
  backend "s3" {
    bucket     = "allcollate-tfstate"
    key        = "master.tfstate"
    region     = "us-east-1"
    access_key = "AKIA2UEZMBOS3JDYS4O5"
  }
}