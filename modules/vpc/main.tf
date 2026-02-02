# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_cidr
  availability_zone = var.az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public_subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_cidr
  availability_zone = var.az
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-private_subnet"
  }
} 

# Public Route Table (Internet access)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}