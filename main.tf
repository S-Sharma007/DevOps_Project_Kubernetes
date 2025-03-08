terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  backend "s3" {
    bucket         = "unique-example-bucket-12345"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "demo-terraform-eks-state-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"

}

module "vpc" {
  source              = "./module/vpc"
  vpc_cidr            = var.vpc_cidr
  availability_zone   = var.availability_zone
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  cluster_name        = var.cluster_name
}


module "eks" {
  source          = "./module/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.subnet_ids
  node_groups     = var.node_groups
}

