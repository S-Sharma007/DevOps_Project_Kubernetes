output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_ids" {
  value = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
}