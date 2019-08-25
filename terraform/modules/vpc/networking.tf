# Internet gateway
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "internet-gateway"
  }
}

# Nat gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat_gw_eip.id}"
  subnet_id     = "${aws_subnet.public_subnet.id}"
}

resource "aws_eip" "nat_gw_eip" {
  vpc = true
}

# Route table
# route tables
resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gw.id}"
  }

  tags {
    Name = "pub-sub-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags {
    Name = "priv-sub-rt"
  }
}

resource "aws_route_table_association" "public-rt-association" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "private-rt-association" {
  subnet_id      = "${aws_subnet.private_subnet.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}
