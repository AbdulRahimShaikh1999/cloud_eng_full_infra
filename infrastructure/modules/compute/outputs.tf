output "web_instance_ids" {
  description = "Web server instance IDs"
  value       = aws_instance.web[*].id
}

output "web_instance_public_ips" {
  description = "Web server public IP addresses"
  value       = aws_instance.web[*].public_ip
}

output "web_eip_addresses" {
  description = "Elastic IP addresses for web servers"
  value       = aws_eip.web[*].public_ip
}

output "app_instance_ids" {
  description = "App server instance IDs"
  value       = aws_instance.app[*].id
}

output "app_instance_private_ips" {
  description = "App server private IP addresses"
  value       = aws_instance.app[*].private_ip
}