module "vpc" {
  source = "./modules/vpc"
  project_name = var.project_name
  vpc_cidr = var.vpc_cidr
  public_cidr = var.public_subnet_cidr
  private_cidr = var.private_subnet_cidr
  az = var.az
}