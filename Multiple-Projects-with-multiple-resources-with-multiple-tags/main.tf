provider "aws" {
  region     = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t3.micro"

  tags = {
    Name = "USA-Project"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "USA-Project"
  }
}
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 10

  tags = {
    Name = "USA-Project"
  }
}

