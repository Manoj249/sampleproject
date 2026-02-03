variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "az" {
  description = "Availability Zone"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type = string
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR block"
  type = string
}

variable "ingress_rules" {
  description = "ingress rules for EC2 "
  type = map(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

variable "dynamodb_table_name" {
  type = string
}