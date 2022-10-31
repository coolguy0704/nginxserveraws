resource "aws_vpc" "nginx-vpc" {
    cidr_block = "${var.VPC_CIDR}"
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
      "Name" = "nginx-vpc"
    }
}

resource "aws_subnet" "nginx-public-subnet-1" {
    vpc_id = "${aws_vpc.nginx-vpc.id}"
    cidr_block = "${var.VPC_PUBLIC_SUBNET_CIDR}"
    map_public_ip_on_launch = true
    availability_zone = "${var.AWS_AZ}"
    tags = {
      "Name" = "nginx-public-subnet-1"
    }
  
}
