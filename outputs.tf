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

output "s3_bucket_name" {
  description = "s3 bucket name created via s3 module"
  value       = module.s3.bucket_name
}

# output "dynamodb_table_name" {
#   value = module.dynamodb_lock.table_name
# }

output "cpu_alarm_name" {
  value = module.cloudwatch.alarm_name
}

output "cpu_alarm_arn" {
  value = module.cloudwatch.alarm_arn
}

output "sns_topic_arn" {
  value = module.cloudwatch.sns_topic_arn
}