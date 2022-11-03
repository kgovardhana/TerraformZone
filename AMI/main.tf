provider "aws" {
  region     = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}
resource "aws_instance" "mycloudserver" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t3.micro"

  tags = {
    Name = "mycloudserver"
  }
}

resource "aws_ami" "example" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = "snap-0781457156238646f"
    volume_size = 8
  }
}
