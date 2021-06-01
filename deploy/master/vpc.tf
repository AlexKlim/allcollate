data "aws_availability_zones" "available" {}

data "aws_region" "current" {
  # Defaults to current provider region if no other filtering is enabled
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  version = "3.0.0"

  name = "vpc-et-${terraform.workspace}"
  cidr = "172.0.0.0/16"

  azs             = ["${data.aws_region.current.name}a", "${data.aws_region.current.name}b"]
  private_subnets = ["172.0.1.0/24", "172.0.2.0/24"]
  public_subnets  = ["172.0.111.0/24", "172.0.112.0/24"]

  enable_nat_gateway   = false
}

data "aws_vpc" "primary" {
  id = "${module.vpc.vpc_id}"
}

data "aws_route_table" "primary" {
  vpc_id = "${data.aws_vpc.primary.id}"

  filter {
    name   = "association.main"
    values = ["true"]
  }
}

resource "aws_security_group" "allow_vpc" {
  name        = "allow_vpc"
  description = "Allow vpc traffic"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}