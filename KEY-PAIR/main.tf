provider "aws" {
  region     = "us-east-1"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

resource "aws_instance" "mycloudserver" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t3.micro"
  key_name = "my-keypair"
  tags = {
    Name = "mycloudserver"
  }
}
resource "aws_key_pair" "mycloudkey" {
  key_name   = "my-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCTVhqLFsEHdSBviBSPsek9ki9BjNCIBizalqigGZY4L4ydcs9zQWYZk7es+gQQYxNqrZGfgubf3XwTz6ty7faGs/oQGtz399mGQLF2dJYveBXRlBQbui94byfAodhtK++zmeadOLihQOF2ux2KAZ2l445n6pUGXrtLB1m04TJcu4JyxVyESYkY1a+iccnUDv9BPYGp56bWQxLl9pfN16oWa0hLqZW3n1DSeIC4ThQaxGbq+saZ6DIYxRuTD23G6qXf3qJMLooLoF9Y2nBizbuNDfU0B9lYd53caYSX/A7W61jjIw8L0H/5/jSQUcRTOklUWaxTJSuK8V3QFskWeoYTUQT+gPl4I5za10EsXS5k4RLlwb2WtwcxOY7wzS4Xd83wFZyeRHsyNKo58oRQpITWyRq+qGzw6KAbfPwlv8kSpxH8QKkxhT3uB+dMEh9AUf6hSn9SBhrgeMuztq8qd+jTXonJFdfCMOKU4SK6kUIvuWnol3yz5gh6yfXURnnaMn8= govardhan@Terrafrom"
}
