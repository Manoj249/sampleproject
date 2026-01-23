module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  public_cidr  = var.public_subnet_cidr
  private_cidr = var.private_subnet_cidr
  az           = var.az
}

module "iam_ec2" {
  source = "./modules/iam-ec2"
  project_name = var.project_name
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
  my_ip = var.my_ip
  ami_id = var.ami_id
  instance_type = var.instance_type
}