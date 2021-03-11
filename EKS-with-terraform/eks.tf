module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.18"
  subnets         = module.vpc.private_subnets

  tags = {
    Environment = "dev"
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "node-group"
      instance_type                 = "t3.small"
      asg_desired_capacity          = 1
      additional_security_group_ids = [aws_security_group.node_group.id]
    },
    {
      name                          = "master-group"
      instance_type                 = "t3.medium"
      additional_security_group_ids = [aws_security_group.master_group.id]
      asg_desired_capacity          = 1
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
