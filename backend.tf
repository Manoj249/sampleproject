terraform {
  backend "s3" {
    bucket = "terraform-demo-week3-state-bucket"
    key    = "terraform/state/terraform.tfstate"
    region = "ap-south-1"
    # dynamodb_table = "terraform-state-lock"
    use_lockfile = true
    encrypt      = true
  }
}