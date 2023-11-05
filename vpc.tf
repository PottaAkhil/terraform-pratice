resource "aws_vpc" "VPC-akhil" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name = "VPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.VPC-akhil.id
  cidr_block = var.public_Subnet

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "Private" {
  vpc_id     = aws_vpc.VPC-akhil.id
  cidr_block = var.private_Subnet

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC-akhil.id

  tags = {
    Name = "aws_internet_gateway"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.VPC-akhil.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "ARI" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_eip" "EIP" {
 
}
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.VPC-akhil.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT.id
  }
  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "ARN" {
  subnet_id      = aws_subnet.Private.id
  route_table_id = aws_route_table.private-route-table.id
}


