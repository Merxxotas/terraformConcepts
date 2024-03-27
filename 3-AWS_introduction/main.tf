terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}


provider "aws" {
  # Configuration options
  region     = "sa-east-1"
  access_key = "AKIAZI2LCZEY33IHZNFS"
  secret_key = "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"
}

resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    description = "Technical Team Leader"
    # key = "value"
  }
}

resource "aws_iam_policy" "admin-user" {
  name   = "AdminUsers"
  policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.admin-user.arn
}
