variable "vpc_name" {
  description = "Name of the vpc to be created"
  type = string
  default = "manaba_vpc"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ssh_key" {
  description = "Name of the EC2 key pair"
  default     = "manaba-key"
}


variable "vpc_az" {
  description = "Availability Zone for the VPC"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_ip_range" {
  description = "Subnet definition for the VPC"
  type        = string
  default     = "10.240.0.0/16"

  validation {
    condition     = can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+/\\d+$", var.vpc_ip_range))
    error_message = "CIDR block must be in valid format, e.g., 10.0.0.0/16"
  }
}