resource "aws_route_table" "updata-vpc-route-table" {
  vpc_id = "${aws_vpc.updata-vpc.id}"

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = "${aws_internet_gateway.updata-vpc-internet-gateway.id}"
  }

  tags = {
    Name = "updata-vpc-route-table"
  }
}

resource "aws_route_table_association" "updata-vpc-route-table-association1" {
  subnet_id      = "${aws_subnet.updata-vpc-subnet1.id}"
  route_table_id = "${aws_route_table.updata-vpc-route-table.id}"
}

resource "aws_route_table_association" "updata-vpc-route-table-association2" {
  subnet_id      = "${aws_subnet.updata-vpc-subnet2.id}"
  route_table_id = "${aws_route_table.updata-vpc-route-table.id}"
}
