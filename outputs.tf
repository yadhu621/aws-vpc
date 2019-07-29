output "vpc_id" {
  value = aws_vpc.london-vpc.id
}

output "public-subnet-1" {
  value = aws_subnet.public-subnet-1.id
}

output "public-subnet-2" {
  value = aws_subnet.public-subnet-1.id
}

output "public-subnet-3" {
  value = aws_subnet.public-subnet-1.id
}

output "london-igw" {
  value = aws_internet_gateway.london-igw.id
}

output "public-route-table" {
  value = aws_route_table.public-route-table.id
}
