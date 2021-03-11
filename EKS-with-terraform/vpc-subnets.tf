resource "aws_subnet" "pub-sub-1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = var.pub_sub_1_cidr
  availability_zone = var.pub_sub_1_zone

  tags = {
    Name = var.pub_sub_1_tag
  }
}

resource "aws_subnet" "pub-sub-2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = var.pub_sub_2_cidr
  availability_zone = var.pub_sub_2_zone

  tags = {
    Name = var.pub_sub_2_tag
  }
}

resource "aws_subnet" "pv-sub-1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = var.pv_sub_1_cidr
  availability_zone = var.pv_sub_1_zone
  tags = {
    Name = var.pv_sub_1_tag
  }
}

resource "aws_subnet" "pv-sub-2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = var.pv_sub_2_cidr
  availability_zone = var.pv_sub_2_zone

  tags = {
    Name = var.pv_sub_2_tag
  }
}
