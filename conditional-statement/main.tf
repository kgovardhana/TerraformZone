provider "aws" {
  region     = "us-east-1"
  #access_key = "AKIA42ZU47GD4A3675XR"
  #secret_key = "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"
}

variable "awsinstance" {
  type = map
  default = {
    "Dev" = "t2.nano",
    "Test" = "t2.small",
    "Prod" = "t2.micro"
  }
}

variable "image" {
  type = list
  default =  ["ami-09d3b3274b6c5d4aa","ami-08c40ec9ead489470","ami-06640050dc3f556bb"]
}

variable "input" {
}

resource "aws_instance" "dev" {
  instance_type = var.awsinstance["Dev"]
  ami           = var.image[0]
  count = var.input == "Dev" ? 2 : 0
}

