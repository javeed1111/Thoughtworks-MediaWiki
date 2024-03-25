provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"  
    }
  }
}

module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"
  version = "17.16.0"  # Specify the version of the EKS module

  cluster_name = "eks_cluster_for_MediaWiki"
  cluster_version = "1.21"
  subnets = ["subnet-0249a2c08da5e58cb", "subnet-00b22146f5849348c"]  
  vpc_id = "vpc-0b73766d2f01cb46b" 
  node_groups = {
    node_group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t2.micro"
    }
  }
}
