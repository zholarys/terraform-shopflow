terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

# Security Group
resource "aws_security_group" "shopflow" {
  name        = "shopflow-sg"
  description = "ShopFlow security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "shopflow-sg"
  }
}

# EC2 Instance
resource "aws_instance" "shopflow" {
  ami                    = "ami-05d62b9bc5a6ca605"
  instance_type          = "t3.micro"
  key_name               = "shopflow-key"
  vpc_security_group_ids = [aws_security_group.shopflow.id]

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "shopflow-terraform"
  }
}

# Output
output "public_ip" {
  value       = aws_instance.shopflow.public_ip
  description = "Public IP of ShopFlow server"
}
