provider "aws" {
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.secret_key
}

# resource example
resource "aws_iam_policy" "policy" {
  name        = "test_policy_1"
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# Custom data value
data "aws_iam_policy_document" "ec2_full" {
    statement {
        effect = "Allow"
        actions = "ec2:*"
    }
}

# Custom data value 
data "aws_iam_policy_document" "s3_full" {
    statement {
        effect = "Allow"
        actions = "s3:*"
    }
}

# Defining object called locals to be referenced later
locals {
    ec2_full_statement = jsonencode(data.aws_iam_policy_document.ec2_full.json)["Statement"]
    s3_full_statement = jsonencode(data.aws_iam_policy_document.s3_full.json)["Statement"]
}

# Combining elements to create more complex policy
resource "aws_iam_policy" "ec2-s3-full" {
    name_prefix = "test-policy_2"
    path = "/"
    description = "Grants full access to ec2 and s3 resources"
    policy = jsonencode({ "Version" : "2012-10-17", "Statement" : concat(local.ec2_full_statement, local.s3_full_statement) })
}

# Example: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy
# Locals: https://www.terraform.io/docs/configuration/locals.html