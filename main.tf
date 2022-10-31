resource "aws_key_pair" "aws-key" {
    key_name = "aws-key"
    public_key = "${var.PUBLIC_KEY_PATH}"
}

resource "aws_instance" "nginxserver" {
    ami = "${var.AMI-ID}"
    instance_type = "${var.INSTANCE_TYPE}"
    subnet_id = "${aws_subnet.nginx-public-subnet-1.id}"
    vpc_security_group_ids = ["${aws_security_group.allow-ssh-http.id}"]
    key_name = "${aws_key_pair.aws-key.id}"
    provisioner "file" {
        source = "nginx.sh"
        destination = "/tmp/nginx.sh"
    }
    provisioner "remote-exec" {
        inline = [
          "sudo chmod +x /tmp/nginx.sh",
          "sudo /tmp/nginx.sh"
        ]
    }
    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
      private_key = "${var.PRIVATE_KEY_PATH}"
    }
}