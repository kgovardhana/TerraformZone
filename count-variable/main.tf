provider "aws" {
  region     = "us-east-1"
  #access_key = "AKIA42ZU47GD4A3675XR"
  #secret_key = "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"
}

variable "instancetag" {
  type = list
  default = ["Dev-server","Test-server","Prod-server"]
}

resource "aws_instance" "dev" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t3.micro"
  count = 3 

  tags = {
    #Name = "dev.${count.index}"
     Name = var.instancetag[count.index]
  }
}
