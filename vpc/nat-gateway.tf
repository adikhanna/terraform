resource "aws_eip" "eip-subnet1" {
  vpc        = true
  depends_on = ["aws_internet_gateway.updata-vpc-internet-gateway"]
}

resource "aws_nat_gateway" "gw-subnet1" {
  subnet_id     = "${aws_subnet.updata-vpc-subnet1.id}"
  allocation_id = "${aws_eip.eip-subnet1.id}"
}

resource "aws_eip" "eip-subnet2" {
  vpc        = true
  depends_on = ["aws_internet_gateway.updata-vpc-internet-gateway"]
}

resource "aws_nat_gateway" "gw-subnet2" {
  subnet_id     = "${aws_subnet.updata-vpc-subnet2.id}"
  allocation_id = "${aws_eip.eip-subnet2.id}"
}