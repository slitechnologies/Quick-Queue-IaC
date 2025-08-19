terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.bl_vpc.id
  cidr_block              = "10.240.1.0/24"
  availability_zone       = var.az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}
resource "aws_vpc" "bl_vpc" {
  cidr_block           = var.vpc_ip_range
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_name
  }
}