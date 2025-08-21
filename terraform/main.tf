terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.8.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

# VPC Module
module "manaba_vpc" {
  source   = "./modules/vpc"
  vpc_name = "manaba_vpc"
}

output "manaba_vpc_id" {
  value = module.manaba_vpc.vpc_id
}

# Master Node
module "manaba_k8s_master" {
  source         = "./modules/public_vps"
  vps_name  = "manaba-k8s-master"
  instance_type  = "t2.micro"  # Free Tier
  vpc_id         = module.manaba_vpc.vpc_id
  subnet_id      = module.manaba_vpc.public_subnet_id
  ssh_key_name   = var.ssh_key
  ami_id         = var.ami_id
}

output "manaba_k8s_master_ip" {
  value = module.manaba_k8s_master.public_ip
}

# Node 1
module "manaba_k8s_node_1" {
  source         = "./modules/public_vps"
  vps_name  = "manaba-k8s-node-1"
  instance_type  = "t2.micro"
  vpc_id         = module.manaba_vpc.vpc_id
  subnet_id      = module.manaba_vpc.public_subnet_id
  ssh_key_name   = var.ssh_key
  ami_id         = var.ami_id
}

output "manaba_k8s_node_1_ip" {
  value = module.manaba_k8s_node_1.public_ip
}

# Node 2
module "manaba_k8s_node_2" {
  source         = "./modules/public_vps"
  vps_name  = "manaba-k8s-node-2"
  instance_type  = "t2.micro"
  vpc_id         = module.manaba_vpc.vpc_id
  subnet_id      = module.manaba_vpc.public_subnet_id
  ssh_key_name   = var.ssh_key
  ami_id         = var.ami_id
}

output "manaba_k8s_node_2_ip" {
  value = module.manaba_k8s_node_2.public_ip
}

# Ansible Inventory File
resource "local_file" "inventory" {
  filename = "../ansible/inventory"
  content = templatefile("ansible_inventory.tftpl", {
    master_ip = module.manaba_k8s_master.public_ip
    node_ips  = [
      module.manaba_k8s_node_1.public_ip,
      module.manaba_k8s_node_2.public_ip
    ]
  })
}