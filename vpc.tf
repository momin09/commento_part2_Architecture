resource "aws_vpc" "commento-vpc" {
  tags = {
    Name = "VPC-AN02-DIA-PRD"
  }

  cidr_block = "1.1.1.0/24"
}

resource "aws_subnet" "commento-sub-pub01" {
  tags = {
    Name = "SBN-AN02-DIA-PRD-PUB-WEB01"
  }
  vpc_id = aws_vpc.commento-vpc.id
  cidr_block = "1.1.1.0/26"
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "commento-sub-pub02" {
  tags = {
    Name = "SBN-AN02-DIA-PRD-PUB-WEB02"
  }
  vpc_id = aws_vpc.commento-vpc.id
  cidr_block = "1.1.64.0/26"
  availability_zone = "ap-northeast-2c"
}

resource "aws_subnet" "commento-sub-priv01" {
  tags = {
    Name = "SBN-AN02-DIA-PRD-PRV-DB1"
  }
  vpc_id = aws_vpc.commento-vpc.id
  cidr_block = "1.1.1.128/26"
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "commento-sub-priv-02" {
  tags = {
    Name = "SBN-AN02-DIA-PRD-PRV-DB2"
  }
  vpc_id = aws_vpc.commento-vpc.id
  cidr_block = "1.1.1.192/26"
  availability_zone = "ap-northeast-2c"
}