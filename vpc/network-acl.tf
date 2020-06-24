resource "aws_network_acl" "vpc-network-acl" {
    vpc_id = "${aws_vpc.updata-vpc.id}"
    subnet_ids = ["${aws_subnet.updata-vpc-subnet1.id}", "${aws_subnet.updata-vpc-subnet2.id}"]

    egress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    tags = {
        Name = "updata-vpc-network-acl"
    }
}
