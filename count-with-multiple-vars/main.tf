provider "aws" {
  region     = "us-east-1"
  #access_key = "AKIA42ZU47GD4A3675XR"
  #secret_key = "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"
}

variable "instancetag" {
  type = list
  default = ["Dev-server","Test-server","Prod-server"]
}

variable "instancetype" {
  type = list
  default = ["t2.nano","t2.small","t2.micro"]
}

variable "image" {
  type = list
  default =  ["ami-09d3b3274b6c5d4aa","ami-08c40ec9ead489470","ami-06640050dc3f556bb"]
}

resource "aws_instance" "dev" {
  instance_type = var.instancetype[0]
  ami           = var.image[0]
  count = 3 

  tags = {
     Name = var.instancetag[0]
  }
}


