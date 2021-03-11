resource "aws_security_group" "node_group" {
  name        = "node_group"
  vpc_id      =  module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "node_group"
  }
}

resource "aws_security_group" "master_group" {
  name        = "master_group"
  vpc_id      =  module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "master_group"
  }
}
