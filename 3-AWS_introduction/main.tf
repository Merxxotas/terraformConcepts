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
  region  = "sa-east-1"
  profile = "terraformCourse"
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
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.admin-user.arn
}

resource "aws_s3_bucket" "finance" {
  bucket = "finance-02042024"
  tags = {
    description = "Finance and Payroll"
  }
}
resource "aws_s3_object" "finance-2024" {
  source = "/home/brayanmarin/s3Proof/terraformVideo0.mp4"
  key    = "terraformVideo0.mp4"
  bucket = aws_s3_bucket.finance.id
}

resource "aws_s3_object" "example" {
  content = "Hello, World!"
  key     = "helloWorld.txt"
  bucket  = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
  group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = <<-EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "*",
        "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.bucket}/*",
        "Principal": {
          "AWS": [
            "${data.aws_iam_group.finance-data.arn}"
          ]
        }
      }
    ]
}
EOF
}

# resource "aws_s3_bucket_object" "finance-2024" {
#   content = "/home/brayanmarin/s3Proof/terraformVideo0.mp4"
#   key     = "terraformVideo0.mp4"
#   bucket  = aws_s3_bucket.finance.id
# }
