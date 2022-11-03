provider "aws" {
  region     = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

resource "aws_instance" "mycloudserver" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t3.micro"

  tags = {
    Name = "mycloudserver"
  }
}

output "instance-info" {
  value = aws_instance.mycloudserver
}

