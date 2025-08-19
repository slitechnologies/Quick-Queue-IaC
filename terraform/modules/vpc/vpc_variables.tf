variable "vpc_name" {
  description = "Name of the vpc to be created"
  type = string
  default = "my_vpc"
}

variable "vpc_ip_range" {
  description = "Subnet definition for the VPC"
  type = string
  default = "10.240.0.0/16"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "ssh_key" {
  description = "Name of the EC2 key pair"
  default     = "manaba-key"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0de716d6197524dd9"  # Ubuntu or Amazon Linux
}

variable "az" {
  description = "Availability Zone for the VPC"
  type        = string
  default     = "us-east-1a"
}