resource "aws_vpc" "london-vpc" {
  cidr_block = "10.0.16.0/22"  # total hosts = 1024
  tags = {
      Name = "london-vpc" 
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.london-vpc.id
  cidr_block = "10.0.16.0/26"
  tags = {
    Name = "public-subnet-1"
  }
}

