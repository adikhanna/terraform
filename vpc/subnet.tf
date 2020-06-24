resource "aws_subnet" "updata-vpc-subnet1" {
    vpc_id     = "${aws_vpc.updata-vpc.id}"
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-2a"

    tags = {
        Name = "updata-vpc-subnet"
    }
}

resource "aws_subnet" "updata-vpc-subnet2" {
    vpc_id     = "${aws_vpc.updata-vpc.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2b"

    tags = {
        Name = "updata-vpc-subnet"
    }
}

resource "aws_subnet" "updata-vpc-subnet3" {
    vpc_id     = "${aws_vpc.updata-vpc.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-2c"

    tags = {
        Name = "updata-vpc-subnet"
    }
}


output "subnet1-id" {
  value = "${aws_subnet.updata-vpc-subnet1.id}"
}

output "subnet2-id" {
  value = "${aws_subnet.updata-vpc-subnet2.id}"
}

output "subnet3-id" {
  value = "${aws_subnet.updata-vpc-subnet3.id}"
}


output "subnet1-cidr" {
  value = "${aws_subnet.updata-vpc-subnet1.cidr_block}"
}

output "subnet2-cidr" {
  value = "${aws_subnet.updata-vpc-subnet2.cidr_block}"
}

output "subnet3-cidr" {
  value = "${aws_subnet.updata-vpc-subnet3.cidr_block}"
}
