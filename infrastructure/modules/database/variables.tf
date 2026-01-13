variable "project_name" {
     description = "Project name"
     type        = string
   }

   variable "private_subnet_ids" {
     description = "List of private subnet IDs"
     type        = list(string)
   }

   variable "rds_security_group_id" {
     description = "Security group ID for RDS"
     type        = string
   }

   variable "db_name" {
     description = "Database name"
     type        = string
     default     = "devopsdb"
   }

   variable "db_username" {
     description = "Database master username"
     type        = string
     default     = "admin"
     sensitive   = true
   }

   variable "db_password" {
     description = "Database master password"
     type        = string
     sensitive   = true
   }

   variable "db_instance_class" {
     description = "RDS instance class"
     type        = string
     default     = "db.t3.micro"
   }

   variable "db_allocated_storage" {
     description = "Allocated storage in GB"
     type        = number
     default     = 20
   }

   variable "multi_az" {
     description = "Enable Multi-AZ deployment"
     type        = bool
     default     = false
   }

   variable "deletion_protection" {
     description = "Enable deletion protection"
     type        = bool
     default     = false
   }

   variable "backup_retention_period" {
     description = "Backup retention period in days"
     type        = number
     default     = 7
   }

   variable "skip_final_snapshot" {
     description = "Skip final snapshot on deletion"
     type        = bool
     default     = true
   }