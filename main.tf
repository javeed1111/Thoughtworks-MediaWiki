provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = "~> 3.0"  
  }
}

module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks_cluster_for_MediaWiki"
  cluster_version = "1.29"  

  subnets = ["subnet-0249a2c08da5e58cb", "subnet-00b22146f5849348c"]
  vpc_id  = "vpc-0b73766d2f01cb46b"

  node_groups = {
    node_group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t2.micro"
    }
  }

  map_roles = [
    {
      "rolearn"       = "arn:aws:iam::111078077848:role/eks_cluster_for_MediaWiki20240325081953889000000002"
      "username"      = "system:node:{{EC2PrivateDNSName}}"
      "groups"        = ["system:bootstrappers", "system:nodes"]
    },
    {
      "rolearn"       = "arn:aws:iam::111078077848:role/eks_cluster_for_MediaWiki20240325081953889000000002"
      "username"      = "system:node:{{EC2PrivateDNSName}}"
      "groups"        = ["system:bootstrappers", "system:nodes"]
    }
  ]
}
