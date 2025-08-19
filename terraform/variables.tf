variable "ssh_key" {
  description = "Name of the EC2 key pair used for SSH access"
  type        = string
  default     = "manaba-key"
}


variable "ami_id" {
  description = "The AMI ID to use for launching EC2 instances"
  type        = string
  default     = "ami-0de716d6197524dd9"
}