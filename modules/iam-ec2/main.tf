# Security Group
resource "aws_security_group" "ec2_sg" {
  name = "${var.project_name}-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
     for_each = var.ingress_rules

     content {
       description = ingress.value.description
       from_port = ingress.value.from_port
       to_port = ingress.value.to_port
       protocol = ingress.value.protocol
       cidr_blocks = ingress.value.cidr_blocks
     }
  } 
  
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#IAM Role
resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
} 

#S3 ReadOnly Policy
resource "aws_iam_role_policy_attachment" "s3_access" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
} 

# Instance Profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-profile"
  role = aws_iam_role.ec2_role.name
}

# EC2 Instance
resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true
  monitoring                  = true
  key_name                    = var.key_name

  tags = {
    Name = "${var.project_name}-ec2"
  }
}