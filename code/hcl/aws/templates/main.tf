provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "foo" {
  count           = 2
  ami             = "ami-b8b45ddf"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow_ssh_access.name}"]
}

resource "aws_security_group" "allow_ssh_access" {
  name        = "ssh_22"
  description = "Allow ingress traffic to port 22 for enabling ssh connection"

  ingress {
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    tier = "dev"
  }
}
