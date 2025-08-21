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


variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type = string
  default     = "ami-00ca32bbc84273381"  # Ubuntu or Amazon Linux
}

variable "ssh_key_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
  default     = "manaba-key"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the instance"
  type        = string
  default     = "0.0.0.0/0"
}