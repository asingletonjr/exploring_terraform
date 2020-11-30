provider "aws" {
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_s3_bucket" "test_bucket" {
    bucket = "samus-test-terraform-bucket"

    tags = {
        Name    = "samus-test-terraform-bucket"
        Environment = "sample"
        # comment out below and run 'terraform plan' to see projected change
        # additional = "additional_tag"
        
    }
}

# Documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket