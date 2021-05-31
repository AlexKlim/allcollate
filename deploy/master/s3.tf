resource "aws_s3_bucket" "allcollate_production" {
  bucket = "et-allcollate-${terraform.workspace}"
  acl    = "public-read"
}