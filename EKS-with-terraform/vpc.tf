data "aws_availability_zones" "available" {}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.6.0"

  name                 = "eks-vpc"
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.pv_subnets
  public_subnets       = var.pub_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
  "kubernetes.io/cluster/${var.cluster_name}" = "shared"
}

public_subnet_tags = {
  "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  "kubernetes.io/role/elb"                      = "1"
}

private_subnet_tags = {
  "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  "kubernetes.io/role/internal-elb"             = "1"
}

}
