provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA42ZU47GD4A3675XR"
  secret_key = "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"
}

terraform {
  backend "s3" {
    bucket = "mycloudindia2022"
    key    = "mycloud/project"
    region = "us-east-1"
    access_key = "AKIA42ZU47GD4A3675XR"
    secret_key = "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"
    dynamodb_table = "mycloudproject" 
  }
}
resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"

  tags = {
    Name = "prod"
  }
}
resource "aws_instance" "db" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"

  tags = {
    Name = "prod"
  }
}
