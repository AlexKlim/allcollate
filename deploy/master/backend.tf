provider "aws" {
  version    = "~> 3.42"
  region     = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

terraform {
  backend "s3" {
    bucket     = "et-allcollate-tfstate"
    key        = "master.tfstate"
    region     = "us-east-1"
    access_key = "AKIA4IAHRYGJZTJUYTFJ"
  }
}