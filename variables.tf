variable "aws_region" {
  type    = string
  default = "eu-north-1"
}
variable "project_name" {
  type    = string
  default = "shopflow"
}
variable "ami_id" {
  type        = string
  description = "Verified Ubuntu x86_64 AMI in the selected region"
}
variable "key_name" {
  type        = string
  description = "Name of an existing EC2 SSH key pair"
}
variable "vpc_id" {
  type        = string
  description = "Existing VPC containing the selected public subnet"
}
variable "subnet_id" {
  type        = string
  description = "Existing public subnet with an Internet Gateway route"
}
variable "admin_ipv4_cidr" {
  type        = string
  description = "Administrator public IPv4 address followed by /32"
  validation {
    condition     = can(cidrnetmask(var.admin_ipv4_cidr)) && can(regex("/32$", var.admin_ipv4_cidr))
    error_message = "Set one administrator IPv4 address with a /32 prefix; world-open SSH is not allowed."
  }
}
variable "instance_type" {
  type    = string
  default = "t3.small"
}
variable "root_volume_size" {
  type    = number
  default = 20
}
