resource "aws_security_group" "ec2" {
      name_prefix = "${var.project_name}-ec2-"
      description = "Security group for EC2 instances"
      vpc_id      = var.vpc_id

      ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = var.allowed_ssh_cidr
        description = "SSH access"
      }

      ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP access"
      }

      ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTPS access"
      }

      egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "All outbound traffic"
      }

      tags = {
        Name = "${var.project_name}-ec2-sg"
      }

      lifecycle {
        create_before_destroy = true
      }
    }

    resource "aws_security_group" "rds" {
      name_prefix = "${var.project_name}-rds-"
      description = "Security group for RDS database"
      vpc_id      = var.vpc_id

      ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        security_groups = [aws_security_group.ec2.id]
        description     = "MySQL from EC2"
      }

      egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "All outbound traffic"
      }

      tags = {
        Name = "${var.project_name}-rds-sg"
      }

      lifecycle {
        create_before_destroy = true
      }
    }