resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "terraform-aws-vpc"
  }
}

resource "aws_eip" "nat" {
  instance = aws_instance.nat.id
  vpc      = true
}

resource "aws_eip" "web-1" {
  instance = aws_instance.web-1.id
  vpc      = true
}

resource "aws_route_table" "ca-central-1-public" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-main.id
  }

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_route_table_association" "ca-central-1-public" {
  subnet_id      = aws_subnet.ca-central-1a-public.id
  route_table_id = aws_route_table.ca-central-1-public.id
}

resource "aws_route_table" "ca-central-1-private" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-main.id
  }

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_route_table_association" "ca-central-1-private" {
  subnet_id      = aws_subnet.ca-central-1-private.id
  route_table_id = aws_route_table.ca-central-1-private.id
}

resource "aws_subnet" "ca-central-1a-public" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block        = var.public_subnet_cidr
  availability_zone = "ca-central-1"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "ca-central-1a-private" {
  vpc_id = aws_vpc.main_vpc.id

  cidr_block        = var.private_subnet_cidr
  availability_zone = "ca-central-1"

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_internet_gateway" "ig-main" {
  vpc_id = aws_vpc.main_vpc.id
}

