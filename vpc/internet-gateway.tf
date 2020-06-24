resource "aws_internet_gateway" "updata-vpc-internet-gateway" {
  vpc_id = "${aws_vpc.updata-vpc.id}"

  tags= {
    Name = "vpc-internet-gateway"
  }
}
