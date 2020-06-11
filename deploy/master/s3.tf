resource "aws_s3_bucket" "allcollate_production" {
  bucket = "allcollate-${terraform.workspace}"
  acl    = "public-read"
}