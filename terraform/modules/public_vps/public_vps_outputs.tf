output "public_ip" {
  description = "Public IPv4 address of the EC2 instance"
  value       = aws_instance.vps.public_ip
}

output "private_ip" {
  description = "Private IPv4 address of the EC2 instance"
  value       = aws_instance.vps.private_ip
}