output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.manaba_vpc.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}


output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.bl_igw.id
}

output "vpc_dsc" {
  description = "The Created VPC"
  value       = aws_vpc.manaba_vpc
}