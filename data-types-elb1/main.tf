provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA42ZU47GDRXBUGAE3"
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

