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

variable "my_ip" {
  type = string
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