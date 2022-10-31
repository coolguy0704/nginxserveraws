variable "AWS_REGION" {
    type = string
    default = "us-east-1"
}

variable "AWS_AZ" {
    type = string
    default = "us-east-1a"
}
variable "VPC_CIDR" {
    type = string
    default = "10.0.0.0/16"
}

variable "VPC_PUBLIC_SUBNET_CIDR" {
    type = string
    default = "10.0.1.0/24"
}

variable "sg_ports" {
    type = list(number)
    default = [ 22,80 ]
}

variable "INSTANCE_TYPE" {
    type = string
    default = "t2.micro"
}

variable "AMI-ID" {
    type = string
    default = "ami-09d3b3274b6c5d4aa"
}

variable "PRIVATE_KEY_PATH" {
    type = string
    default = "/Users/prakashraobethapudi/Desktop/github/key_pair.pem"
}
variable "PUBLIC_KEY_PATH" {
    type = string
    default = "/Users/prakashraobethapudi/Desktop/github/key_pair.pem.pub"
}