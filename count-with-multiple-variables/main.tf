provider "aws" {
  region     = "us-east-1"
  #access_key = "AKIA42ZU47GD4A3675XR"
  #secret_key = "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"
}

variable "instancetag" {
  type = list
  default = ["Dev-server","Test-server","Prod-server"]
}

variable "image" {
  type = list
  default = ["ami-09d3b3274b6c5d4aa","ami-08c40ec9ead489470","ami-06640050dc3f556bb"]
}

variable "instancetype" {
  type = list
  default = ["t2.nano","t2.small","t2.micro"]
}


resource "aws_instance" "dev" {
  ami           = var.image[count.index]
  instance_type = var.instancetype[count.index]
  count = 3 

  tags = {
    #Name = "dev.${count.index}"
     Name = var.instancetag[count.index]
  }
}
