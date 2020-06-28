resource "aws_security_group" "vpc-security-group" {
    name        = "vpc-security-group"
    description = "Allow HTTP, HTTPS, and SSH"
    vpc_id      = "${aws_vpc.updata-vpc.id}"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "security-group-id" {
  value = "${aws_security_group.vpc-security-group.id}"
}
