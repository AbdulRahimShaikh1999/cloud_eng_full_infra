# Get the latest Ubuntu 22.04 AMI
   data "aws_ami" "ubuntu" {
     most_recent = true
     owners      = ["099720109477"]  # Canonical

     filter {
       name   = "name"
       values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
     }

     filter {
       name   = "virtualization-type"
       values = ["hvm"]
     }

     filter {
       name   = "root-device-type"
       values = ["ebs"]
     }
   }

   # Web server in public subnet
   resource "aws_instance" "web" {
     count                       = var.web_instance_count
     ami                         = data.aws_ami.ubuntu.id
     instance_type               = var.web_instance_type
     subnet_id                   = var.public_subnet_ids[count.index % length(var.public_subnet_ids)]
     vpc_security_group_ids      = [var.ec2_security_group_id]
     associate_public_ip_address = true
     key_name                    = var.key_pair_name

     root_block_device {
       volume_type           = "gp3"
       volume_size           = 20
       delete_on_termination = true
       encrypted             = true
     }

     monitoring = true

     tags = {
       Name = "${var.project_name}-web-${count.index + 1}"
       Role = "web-server"
     }

     metadata_options {
       http_endpoint               = "enabled"
       http_tokens                 = "required"
       http_put_response_hop_limit = 1
     }
   }

   # App server in private subnet
   resource "aws_instance" "app" {
     count                  = var.app_instance_count
     ami                    = data.aws_ami.ubuntu.id
     instance_type          = var.app_instance_type
     subnet_id              = var.private_subnet_ids[count.index % length(var.private_subnet_ids)]
     vpc_security_group_ids = [var.ec2_security_group_id]
     key_name               = var.key_pair_name

     root_block_device {
       volume_type           = "gp3"
       volume_size           = 20
       delete_on_termination = true
       encrypted             = true
     }

     monitoring = true

     tags = {
       Name = "${var.project_name}-app-${count.index + 1}"
       Role = "app-server"
     }

     metadata_options {
       http_endpoint               = "enabled"
       http_tokens                 = "required"
       http_put_response_hop_limit = 1
     }
   }

   # Elastic IPs for web servers (for stable public IPs)
   resource "aws_eip" "web" {
     count    = var.web_instance_count
     instance = aws_instance.web[count.index].id
     domain   = "vpc"

     tags = {
       Name = "${var.project_name}-eip-web-${count.index + 1}"
     }

     depends_on = [aws_instance.web]
   }