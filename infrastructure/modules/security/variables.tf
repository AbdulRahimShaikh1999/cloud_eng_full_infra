variable "project_name" {
      description = "Project name"
      type        = string
    }

    variable "vpc_id" {
      description = "VPC ID"
      type        = string
    }

    variable "allowed_ssh_cidr" {
      description = "CIDR blocks allowed for SSH"
      type        = list(string)
      default     = ["0.0.0.0/0"]
    }