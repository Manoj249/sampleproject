output "ec2_instance_id" {
  value = aws_instance.ec2.id
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}