resource "aws_ecr_repository" "allcollate" {
  name = "allcollate"
}

resource "aws_ecr_repository_policy" "allcollate_policy" {
  repository = "${aws_ecr_repository.allcollate.name}"
  policy     = "${data.aws_iam_policy_document.iam_policy_document_access.json}"
}

resource "aws_ecr_lifecycle_policy" "allcollate" {
  repository = "${aws_ecr_repository.allcollate.name}"

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Remove old images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

data "aws_iam_policy_document" "iam_policy_document_access" {
  statement {
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::730466093989:root"
      ]
    }
  }
}