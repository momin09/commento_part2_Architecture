resource "aws_internet_gateway" "commento-igw" {
  tags = {
    Name = "IGW-AN2-DAI-PRD"
    Description = "Internet Gateway for the VPC"
  }

  vpc_id = aws_vpc.commento-vpc.id 
}

resource "aws_route_table" "commento-route-table-public" {
  tags = {
    Name = "RT-AN2-DAI-PRD-PUB"
    Description = "Route Table for public subnet"
  }

  vpc_id = aws_vpc.commento-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.commento-igw.id
  }
}

resource "aws_route_table_association" "commento-route-table-association-pub01" {
  subnet_id = aws_subnet.commento-sub-pub01.id
  route_table_id = aws_route_table.commento-route-table-public.id
}

resource "aws_route_table_association" "commento-route-table-association-pub02" {
  subnet_id = aws_subnet.commento-sub-pub02.id
  route_table_id = aws_route_table.commento-route-table-public.id
}

resource "aws_route_table" "commento-route-table-priv01" {
  tags = {
    Name = "RT-AN2-DAI-PRD-PRIV1"
    Description = "Route Table for private subnet1"
  }

  vpc_id = aws_vpc.commento-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.commento-igw.id
  }
}

resource "aws_route_table" "commento-route-table-priv02" {
  tags = {
    Name = "RT-AN2-DAI-PRD-PRIV2"
    Description = "Route Table for private subnet2"
  }

  vpc_id = aws_vpc.commento-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.commento-igw.id
  }
}

resource "aws_route_table_association" "commento-route-table-association-priv01" {
  subnet_id = aws_subnet.commento-sub-priv01.id
  route_table_id = aws_route_table.commento-route-table-priv01.id
}

resource "aws_route_table_association" "commento-route-table-association-priv02" {
  subnet_id = aws_subnet.commento-sub-priv02.id
  route_table_id = aws_route_table.commento-route-table-priv02.id
}