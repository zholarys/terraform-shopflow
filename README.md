# Terraform ShopFlow Infrastructure

Provisions AWS infrastructure for ShopFlow using Terraform.

## What it creates
- EC2 t3.micro instance (Ubuntu 26.04)
- Security Group (ports 22, 80, 443)

## Usage
terraform init
terraform plan
terraform apply
terraform destroy

## Requirements
- AWS credentials configured (~/.aws/credentials)
- SSH key pair "shopflow-key" in AWS
