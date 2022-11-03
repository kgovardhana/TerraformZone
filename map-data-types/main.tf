provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA42ZU47GDS27FBYPK"
  secret_key = "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"
}

variable "elbname" {
  type = string
  
}

variable "azname" {
  type = list
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "timeout" {
  type = number 
}

# Create a new load balancer
resource "aws_elb" "bar" {
  name               = var.elbname
  availability_zones = var.azname

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

    health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "mycloudelb"
  }
}

variable "mapvar" {
  type = map
  default = {
    "dev" = "t2.nano"
    "test" = "t2.small"
    "prod" = "t2.micro"
  }
}
variable "instancetag" {
  type = list
  default = ["Dev-server","Test-server","Prod-server"]
}
variable "image" {
  type = list
  default = ["ami-09d3b3274b6c5d4aa","ami-08c40ec9ead489470","ami-06640050dc3f556bb"]
}
resource "aws_instance" "dev" {
  instance_type = var.mapvar["dev"]
  ami           = var.image[0]
  tags = {
    Name = var.instancetag[0]
  }
}

resource "aws_instance" "test" {
  instance_type = var.mapvar["test"]
  ami           = var.image[1]
  tags = {
    Name = var.instancetag[1]
  }
}

resource "aws_instance" "prod" {
  instance_type = var.mapvar["prod"]
  ami           = var.image[2]
  tags = {
    Name = var.instancetag[2]
  }
}
