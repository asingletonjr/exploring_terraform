# using variables substitution
resource "aws_vpc" "samus-test-vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_tag_name
    }
}

resource "aws_subnet" "samus-test-subnet" {
    # important that the vpc_id is being outputed for use but subnet
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr

    tags = {
        Name = var.subnet_tag_name
    }
}

# output is required for external reference
output "vpc_id" {
    value = aws_vpc.samus-test-vpc.id
}

output "subnet_id" {
    value = aws_subnet.samus-test-subnet.id
}


# Documenation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet