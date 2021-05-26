provider "aws" {
  version    = "~> 2.47"
  region     = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

terraform {
  backend "s3" {
    bucket     = "et-allcollate-tfstate"
    key        = "ecs.tfstate"
    region     = "us-east-1"
    access_key = "AKIA4IAHRYGJZTJUYTFJ"
  }
}

data "terraform_remote_state" "master" {
  backend = "s3"

  config {
    bucket = "et-allcollate-tfstate"
    key    = "env:/${terraform.workspace}/master.tfstate"
    region = "us-east-1"

    access_key = "AKIA4IAHRYGJZTJUYTFJ"
    secret_key = "${var.secret_key}"
  }
}