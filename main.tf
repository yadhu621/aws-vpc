resource "aws_vpc" "london-vpc" {
  cidr_block = "10.0.16.0/22"  # total hosts = 1024
  tags = {
      Name = "london-vpc" 
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.london-vpc.id
  cidr_block = "10.0.16.0/26" # total hosts = 64
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id = aws_vpc.london-vpc.id
  cidr_block = "10.0.16.64/26" # total hosts = 64
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id = aws_vpc.london-vpc.id
  cidr_block = "10.0.16.128/26" # total hosts = 64
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_internet_gateway" "london-igw" {
  vpc_id = aws_vpc.london-vpc.id
  tags = {
    Name = "london-igw"
  }
}

# create route table for public
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
# attach route table to public subnets
