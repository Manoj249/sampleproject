variable "project_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
    type = string
}

variable "ingress_rules" {
  description = "Ingress rules for EC2"
  type = map(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
}

variable "key_name" {
  type = string
}

