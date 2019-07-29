output "vpc_id" {
  value = aws_vpc.london-vpc.id
}

output "public-subnet-1" {
  value = aws_subnet.public-subnet-1.id
}
