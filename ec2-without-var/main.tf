provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA42ZU47GD4A3675XR"
  secret_key = "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"
}

resource "aws_instance" "mycloudserver-1" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t3.micro"

  tags = {
    Name = "mycloudserver-1"
  }
}

resource "aws_instance" "mycloudserver-2" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t3.micro"

  tags = {
    Name = "mycloudserver-2"
  }
}
