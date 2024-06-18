provider "aws" {
  region     = var.aws_region
  profile = var.profile
}

# VPC
module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
  vpc_name       = "hogehoge"
}

# EC2
module "ec2" {
  source         = "../../modules/ec2"
}
