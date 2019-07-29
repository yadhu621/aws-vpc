output "vpc_id" {
  value = aws_vpc.london-vpc.id
}

output "public-subnets" {
  value = aws_subnet.public-subnets.*.id
}
