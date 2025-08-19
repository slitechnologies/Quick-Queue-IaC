resource "aws_instance" "vps" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.vps_sg.id]
  key_name                    = var.ssh_key_name
  associate_public_ip_address = true

  tags = {
    Name = var.vps_name
  }
}

resource "aws_security_group" "vps_sg" {
  name        = "${var.vps_name}-sg"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vps_name}-sg"
  }
}