variable "project_name" {
  description = "Project name"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "Security group ID for EC2 instances"
  type        = string
}

variable "web_instance_count" {
  description = "Number of web server instances"
  type        = number
  default     = 1
}

variable "web_instance_type" {
  description = "Instance type for web servers"
  type        = string
  default     = "t2.micro"
}

variable "app_instance_count" {
  description = "Number of app server instances"
  type        = number
  default     = 1
}

variable "app_instance_type" {
  description = "Instance type for app servers"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
  default     = ""
}