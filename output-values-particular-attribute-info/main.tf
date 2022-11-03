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

resource "aws_vpc" "main" {
  cidr_block   = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}

output "instance-ami" {
  value = aws_instance.mycloudserver.ami
}

output "instance-arn" {
  value = aws_instance.mycloudserver.arn
}

output "instance-cpu" {
  value = aws_instance.mycloudserver.cpu_core_count
}

output "vpc-cidr" {
  value = aws_vpc.main.cidr_block
}
