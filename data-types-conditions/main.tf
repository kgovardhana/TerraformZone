provider "aws" {
  region     = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}
variable "instancetype" {
  type = map
  default = {
    "dev" = "t2.nano"
    "test" = "t2.small"
    "prod" = "t2.micro"
  }
}
variable "image" {
  type = list
  default = ["ami-09d3b3274b6c5d4aa","ami-08c40ec9ead489470","ami-06640050dc3f556bb"]
}

variable "input" {
}

resource "aws_instance" "dev" {
  instance_type = var.instancetype["dev"]
  ami           = var.image[0]
  count = var.input == "dev" ? 1 : 0   
  tags = {
     Name = "Dev.Department"
  }
}

