output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.bl_vpc.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

# output "vpc_dsc" {
#   description = "The Created VPC"
#   value       = aws_vpc.bl_vpc
# }