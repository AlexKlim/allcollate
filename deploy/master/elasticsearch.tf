data "aws_caller_identity" "current" {
}

resource "aws_elasticsearch_domain" "search" {
  domain_name           = "allcollate-elasticsearch"
  elasticsearch_version = "7.1"

  cluster_config {
    instance_type  = "t3.small.elasticsearch"
    instance_count = "1"
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = 10
  }
}

resource "aws_elasticsearch_domain_policy" "main" {
  domain_name = aws_elasticsearch_domain.search.domain_name

  access_policies = <<POLICIES
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${aws_iam_user.aws_elasticsearch_user.name}"
      },
      "Action": "es:*",
      "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${aws_elasticsearch_domain.search.domain_name}/*"
    }
  ]
}
POLICIES

}

resource "aws_iam_user" "aws_elasticsearch_user" {
  name = "elasticSearchUser"
}

resource "aws_iam_access_key" "aws_elasticsearch_user" {
  user = aws_iam_user.aws_elasticsearch_user.name
}

resource "aws_ssm_parameter" "aws_search_elasticsearch_user_secret_key" {
  name      = "/elasticSearch/elasticSearchUser/SecretKey"
  type      = "SecureString"
  value     = aws_iam_access_key.aws_elasticsearch_user.secret
  overwrite = true
}

resource "aws_ssm_parameter" "aws_elasticsearch_user_access_key" {
  name      = "/elasticSearch/elasticSearchUser/AccessKey"
  type      = "SecureString"
  value     = aws_iam_access_key.aws_elasticsearch_user.id
  overwrite = true
}

resource "aws_ssm_parameter" "aws_elasticsearch_host" {
  name      = "/elasticSearch/host"
  type      = "String"
  value     = "https://${aws_elasticsearch_domain.search.endpoint}"
  overwrite = true
}