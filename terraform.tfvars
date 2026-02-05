aws_region          = "ap-south-1"
project_name        = "terraform-vpc-week1"
az                  = "ap-south-1a"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
ami_id              = "ami-0ced6a024bb18ff2e"
instance_type       = "t2.micro"
key_name            = "terraform-keypair"

ingress_rules = {
  ssh = {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.37.130.92/32"]
  },

  http = {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

s3_bucket_name = "terraform-demo-week3-state-bucket"
# dynamodb_table_name = "terraform-state-lock"