provider "aws" {
  region     = "us-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "mycloudserver" {
  ami           = "ami-id"
  instance_type = "t3.micro"

  tags = {
    Name = "mycloudserver"
  }
}

