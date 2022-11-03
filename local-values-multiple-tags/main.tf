provider "aws" {
  region     = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

locals {
  common_tag = {
    Name = "USA-Project"
    Owner = "Govardhan"
    }
}

locals {
  UK = {
    Name = "UK-Project"
    Owner = "vardhan"
    }
}
resource "aws_instance" "web" {
  ami           = "ami-06640050dc3f556bb"
  instance_type = "t3.micro"
  tags          = local.common_tag
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags             = local.common_tag
}
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 10
  tags              = local.common_tag
}

resource "aws_instance" "uk1" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t3.micro"
  tags          = local.UK
}

resource "aws_vpc" "uk2" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags             = local.UK
}
resource "aws_ebs_volume" "uk3" {
  availability_zone = "us-east-1a"
  size              = 10
  tags              = local.UK
}
