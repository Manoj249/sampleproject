output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_cidr" {
  value = module.vpc.public_subnet_cidr
}

output "private_subnet_cidr" {
  value = module.vpc.private_subnet_cidr
}

output "ec2_instance_id" {
  value = module.iam_ec2.ec2_instance_id
}