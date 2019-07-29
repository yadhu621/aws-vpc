## VPC
resource "aws_vpc" "london-vpc" {
  cidr_block  = var.vpc_cidr  # total hosts = 1024
  tags = {
      Name = "london-vpc" 
  }
}

## Internet Gateway
resource "aws_internet_gateway" "london-igw" {
  vpc_id = aws_vpc.london-vpc.id
  tags = {
    Name = "london-igw"
  }
}

## Subnets : public
resource "aws_subnet" "public-subnets" {
  count       = length(var.public_cidr)
  vpc_id      = aws_vpc.london-vpc.id
  cidr_block  = element(var.public_cidr, count.index)
  tags = {
    Name = "public-subnet-${count.index+1}"
  }
}


# Route table : public
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.london-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.london-igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}
# Route table associations : public
resource "aws_route_table_association" "public-route-table-association" {
  count           = length(var.public_cidr)
  subnet_id       = element(aws_subnet.public-subnets.*.id,count.index)
  route_table_id  = aws_route_table.public-route-table.id
}
