resource "aws_ecr_repository" "allcollate" {
  name = "allcollate"
}

resource "aws_ecr_repository_policy" "allcollate_policy" {
  repository = "${aws_ecr_repository.allcollate.name}"
  policy     = "${data.aws_iam_policy_document.iam_policy_document_access.json}"
}

data "aws_iam_policy_document" "iam_policy_document_access" {
  statement {
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
    ]

    principals = {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::730466093989:root"
      ]
    }
  }
}