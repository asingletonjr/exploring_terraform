# vpc stuff
variable "vpc_id" {}
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "vpc_tag_name" {
    default = "terraform-sample-vpc"
}

# subnet stuff
variable "subnet_cidr" {
    default = "10.0.1.0/24"
}
variable "subnet_tag_name" {
    default = "terraform-sample-subnet"
}

# ec2 instance stuff
variable "tenancy" {
    default = "dedicated"
}