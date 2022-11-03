vi main.tf

provider "aws" {
  region     = "us-east-1"
  #access_key = "AKIA42ZU47GD4A3675XR"
  #secret_key = "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"
}

terraform {
  backend "s3" {
    bucket = "india1985"
    key    = "mycloud/project"
    region = "us-east-1"
    access_key = "my-access-key"
    secret_key = "my-secret-key"
#   dynamodb_table = "vardhan" - locking mechanism
  }
}
resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.nano"

  tags = {
    Name = "Dev"
  }
}
resource "aws_instance" "db" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.small"

  tags = {
    Name = "Dev"
  }
}
