output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_cidr" {
  value = module.vpc.public_subnet.id
}

output "private_subnet_cidr" {
  value = module.vpc.private_subnet.id
}