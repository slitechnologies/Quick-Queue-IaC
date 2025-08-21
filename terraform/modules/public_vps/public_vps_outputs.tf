output "public_ip" {
  description = "Public IPv4 address of the EC2 instance"
  value       = aws_instance.vps.public_ip
}

output "private_ip" {
  description = "Private IPv4 address of the EC2 instance"
  value       = aws_instance.vps.private_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.vps.id
}

output "availability_zone" {
  description = "AZ where the EC2 instance is launched"
  value       = aws_instance.vps.availability_zone
}

output "key_name" {
  description = "SSH key pair name used for the instance"
  value       = aws_instance.vps.key_name
}

output "instance_type" {
  description = "Type of EC2 instance"
  value       = aws_instance.vps.instance_type
}

output "security_group_id" {
  description = "ID of the security group attached to the instance"
  value       = aws_security_group.vps_sg.id
}