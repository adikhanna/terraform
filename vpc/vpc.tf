resource "aws_vpc" "updata-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "updata-vpc"
  }
}

output "id" {
  value = "${aws_vpc.updata-vpc.id}"
}
