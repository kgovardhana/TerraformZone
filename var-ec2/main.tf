provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA42ZU47GD4A3675XR"
  secret_key = "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"
}

variable "instancetype" {
     default = "t2.micro"
}

variable "image" {
     default = "ami-026b57f3c383c2eec"
}   

resource "aws_instance" "mycloudserver-1" {
  ami           = var.image
  instance_type = var.instancetype

  tags = {
    Name = "mycloudserver-1"
  }
}

resource "aws_instance" "mycloudserver-2" {
  ami           = var.image
  instance_type = var.instancetype

  tags = {
    Name = "mycloudserver-2"
  }
}
