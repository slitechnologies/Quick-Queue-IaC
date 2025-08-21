terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
  }
}

# Internet Gateway
resource "aws_internet_gateway" "bl_igw" {
  vpc_id = aws_vpc.manaba_vpc.id
  
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.manaba_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bl_igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.manaba_vpc.id
  cidr_block              = "10.240.1.0/24"
  availability_zone       = var.vpc_az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}
resource "aws_vpc" "manaba_vpc" {
  cidr_block           = var.vpc_ip_range
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.manaba_vpc.default_route_table_id

  tags = {
    Name = "${var.vpc_name}-default-rt"
  }
}