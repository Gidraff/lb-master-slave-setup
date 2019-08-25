resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "main"
  }
}

# Subnets
resource "aws_subnet" "public_subnet" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.pub_subnet_cidr}"
  availability_zone = "${var.availability_zone}"

  tags {
    Name = "public-Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.priv_subnet_cidr}"
  availability_zone = "${var.availability_zone}"

  tags {
    Name = "private-subnet"
  }
}
