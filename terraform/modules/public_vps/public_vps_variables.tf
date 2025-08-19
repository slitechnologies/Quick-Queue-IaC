variable "vpc_id" {
  description = "ID of the VPC to launch the EC2 instance in"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to launch the EC2 instance in"
  type        = string
}

variable "vps_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "ssh_key_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}