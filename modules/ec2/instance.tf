resource "aws_instance" "sample-web" {
    count = "1"
    ami = var.ami_id
    instance_type = var.instance_type
    tenancy = var.tenancy
    subnet_id = var.subnet_id
    
    tags = {
        Name = "terraform-sample-instance"
    }
}