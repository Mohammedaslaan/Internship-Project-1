
output "public_sg_id" {
  description = "The ID of the security group"
  value       = module.public_sg.security_group_id
}

output "public_sg_vpc_id" {
  description = "The VPC ID"
  value       = module.public_sg.security_group_vpc_id
}

output "public_sg_name" {
  description = "The name of the security group"
  value       = module.public_sg.security_group_name
}

output "public_sg_description" {
  description = "The description of the security group"
  value       = module.public_sg.security_group_description
}
#--------------------------------------------

output "loadbalancer_sg_id" {
  description = "The ID of the security group"
  value       = module.loadbalancer_sg.security_group_id
}

output "loadbalancer_sg_vpc_id" {
  description = "The VPC ID"
  value       = module.loadbalancer_sg.security_group_vpc_id
}

output "loadbalancer_sg_name" {
  description = "The name of the security group"
  value       = module.loadbalancer_sg.security_group_name
}

output "loadbalancer_sg_description" {
  description = "The description of the security group"
  value       = module.loadbalancer_sg.security_group_description
}

#//////////////////////////////////////////////////////////////
