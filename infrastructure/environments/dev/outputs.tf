output "vpc_id" {
      description = "VPC ID"
      value       = module.vpc.vpc_id
    }

    output "public_subnet_ids" {
      description = "Public subnet IDs"
      value       = module.vpc.public_subnet_ids
    }

    output "private_subnet_ids" {
      description = "Private subnet IDs"
      value       = module.vpc.private_subnet_ids
    }

    output "ec2_security_group_id" {
      description = "EC2 security group ID"
      value       = module.security.ec2_security_group_id
    }

    output "rds_security_group_id" {
      description = "RDS security group ID"
      value       = module.security.rds_security_group_id
    }

    output "web_instance_ids" {
     description = "Web server instance IDs"
     value       = module.compute.web_instance_ids
   }

   output "web_instance_public_ips" {
     description = "Web server public IP addresses"
     value       = module.compute.web_instance_public_ips
   }

   output "web_eip_addresses" {
     description = "Elastic IP addresses for web servers"
     value       = module.compute.web_eip_addresses
   }

   output "app_instance_ids" {
     description = "App server instance IDs"
     value       = module.compute.app_instance_ids
   }

   output "app_instance_private_ips" {
     description = "App server private IP addresses"
     value       = module.compute.app_instance_private_ips
   }

   output "db_instance_id" {
     description = "RDS instance ID"
     value       = module.database.db_instance_id
   }

   output "db_endpoint" {
     description = "RDS database endpoint"
     value       = module.database.db_endpoint
   }

   output "db_address" {
     description = "RDS database address"
     value       = module.database.db_address
   }

   output "db_port" {
     description = "RDS database port"
     value       = module.database.db_port
   }

   output "db_name" {
     description = "RDS database name"
     value       = module.database.db_name
   }

   output "db_username" {
     description = "RDS database username"
     value       = module.database.db_username
     sensitive   = true
   }