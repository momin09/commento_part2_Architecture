resource "aws_internet_gateway" "commento-igw" {
  tags = {
    Name = "IGW-AN2-DAI-PRD"
    Description = "Internet Gateway for the VPC"
  }

  vpc_id = aws_vpc.commento-vpc.id 
}

resource "aws_route_table" "commento-route-table" {
  tags = {
    Name = "RT-AN2-DAI-PRD-PUB"
    Description = "Route Table for public subnet"
  }

  route {

  }
}

resource "aws_route_table_association" "commento-route-table-association-pub01" {
  subnet_id = aws_subnet.commento-sub-pub01.id
  route_table_id = aws_route_table.commento-route-table.id
}

resource "aws_route_table_association" "commento-route-table-association-pub02" {
  subnet_id = aws_subnet.commento-sub-pub02.id
  route_table_id = aws_route_table.commento-route-table.id
}

resource "aws_route_table" "commento-route-table" {
    tags = {
        Name = ""
    }
}