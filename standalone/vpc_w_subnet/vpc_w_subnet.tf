provider "aws" {
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_vpc" "samus-test-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "terraform-sample-vpc"
    }
}

# reference resource id without quotes so it reads as object
resource "aws_subnet" "samus-test-subnet" {
    vpc_id = aws_vpc.as-test-vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "samus-test-subnet"
    }
}

# Documenation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet