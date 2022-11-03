provider "aws" {
  region     = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

resource "aws_instance" "mycloudserver" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.mycloudserversg.id]
  tags = {
    Name = "mycloudserver"
  }
}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_security_group" "mycloudserversg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
