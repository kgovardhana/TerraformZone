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

resource "aws_ami_copy" "example" {
  name              = "terraform-example-copy"
  description       = "A copy of ami-xxxxxxxx"
  source_ami_id     = "ami-077e45485c986473b"
  source_ami_region = "us-east-1"

  tags = {
    Name = "HelloWorld"
  }
}
