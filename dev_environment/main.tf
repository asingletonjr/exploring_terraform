provider "aws" {
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.secret_key
}

# Source can be local folder or actual github link
module "dev_vpc" {
    # general stuff
    source = "../modules/vpc"
    # vpc stuff (using output to grab vpc id)
    vpc_id = module.dev_vpc.vpc_id
    # ec2 instance stuff
    tenancy = "default"
    # subnet stuff
    subnet_cidr = "10.0.0.0/24"
}


# not listing variables means the default defined values defined will be used
module "dev_ec2" {
    source = "../modules/ec2"
    ami_id = "ami-0b0f4c27376f8aa79"
    subnet_id = module.dev_vpc.subnet_id
    tenancy = "default"
}