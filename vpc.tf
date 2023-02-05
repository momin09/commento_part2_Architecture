resource "aws_vpc" "commento-vpc" {
  tags = {
    Name = "VPC-AN2-DIA-PRD"
  }

  cidr_block = "1.1.1.0/24"
}

resource "aws_main_route_table_association" "commento-vpc-main-route-table"{
  vpc_id = aws_vpc.commento-vpc.id
  route_table_id = aws_route_table.commento-route-table-public.id
}

resource "aws_subnet" "commento-sub-pub01" {
  tags = {
    Name = "SBN-AN2a-DIA-PRD-PUB-WEB01"
  }
  vpc_id = aws_vpc.commento-vpc.id
  cidr_block = "1.1.1.0/26"
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "commento-sub-pub02" {
  tags = {
    Name = "SBN-AN2c-DIA-PRD-PUB-WEB02"
  }
  vpc_id = aws_vpc.commento-vpc.id
  cidr_block = "1.1.1.64/26"
  availability_zone = "ap-northeast-2c"
}

resource "aws_subnet" "commento-sub-priv01" {
  tags = {
    Name = "SBN-AN2a-DIA-PRD-PRV-DB1"
  }
  vpc_id = aws_vpc.commento-vpc.id
  cidr_block = "1.1.1.128/26"
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "commento-sub-priv02" {
  tags = {
    Name = "SBN-AN2c-DIA-PRD-PRV-DB2"
  }
  vpc_id = aws_vpc.commento-vpc.id
  cidr_block = "1.1.1.192/26"
  availability_zone = "ap-northeast-2c"
}