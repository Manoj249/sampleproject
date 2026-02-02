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
  subnet_id = module.vpc.public_subnet_cidr
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  ingress_rules = var.ingress_rules
}

module "s3" {
  source = "./modules/S3"
  bucket_name = var.s3_bucket_name
}

module "dynamodb_lock" {
  source = "./modules/dynamodb"
  table_name = var.dynamodb_table_name

}
