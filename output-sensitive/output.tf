output "instance-ami" {
  value = aws_instance.mycloudserver.ami
}

output "instance-arn" {
  value = aws_instance.mycloudserver.arn
  sensitive = true
}

output "instance-cpu" {
  value = aws_instance.mycloudserver.cpu_core_count
}

output "vpc-cidr" {
  value = aws_vpc.main.cidr_block
}

