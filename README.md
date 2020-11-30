# Exploring Terraform

### Purpose
- To explore basic of terraform infrastructure building tool

### Structure
- Standalone:
    S3
    VPC
- Modules:
    EC2
    Networking

### Implementation
- `cd` into dev_environment, standalone/s3, or standalone/vpc_w_subnet folder
- `terraform init` to create base terraform folder with plugins
- `terraform plan` to see proposed changes
- `terraform apply` to start resource creation with prompt
- `terraform apply --auto-approve` to start resource creation without prompt

### Documentation
- Download: https://www.terraform.io/downloads.html
- Official Docs: https://www.terraform.io/

### Secrets.tf
-  Running module or standalone terraform files requires a variables.tf (or any name) file with the following structure:
```
variable "access_key" {
    default = "placeholder_access_key"
}

variable "secret_key" {
    default = "placeholder_secret_key"
}
```