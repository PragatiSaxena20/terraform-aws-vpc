output "vpc_id" {
  description = "ID of the VPC."
  value       = module.networking.vpc_id
}

output "subnet_id" {
  description = "ID of the subnet."
  value       = module.networking.subnet_id
}

output "sg_id" {
  description = "ID of the security group."
  value       = module.security.sg_id
}
