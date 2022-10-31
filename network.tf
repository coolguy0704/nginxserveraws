resource "aws_internet_gateway" "nginx-igw" {
    vpc_id = "${aws_vpc.nginx-vpc.id}"
    tags = {
      "Name" = "nginx-igw"
    }
  
}

resource "aws_route_table" "nginx-public-crt" {
    vpc_id = "${aws_vpc.nginx-vpc.id}"
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.nginx-igw.id}"
    }
    tags = {
      "Name" = "nginx-public-crt"
    }
}

resource "aws_route_table_association" "nginx-crt-subnet" {
    subnet_id = "${aws_subnet.nginx-public-subnet-1.id}"
    route_table_id = "${aws_route_table.nginx-public-crt.id}"
}

resource "aws_security_group" "allow-ssh-http" {
    vpc_id = "${aws_vpc.nginx-vpc.id}"
    name = "allow-ssh-http"
    description = "allow ssh and http traffic"
    dynamic "ingress" {
      for_each = "${var.sg_ports}"
      iterator = port
      content {
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
    
    tags = {
      "Name" = "allow-ssh-http"
    }
}

