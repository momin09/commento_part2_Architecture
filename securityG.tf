resource "aws_security_group" "commento-security-group-instance" {
  tags = {
    Name = "SG-DAI-PRD-INFO-WEB"
    Description = "Security for Instance"
  }
  name = "SG-DAI-PRD-INFO-WEB"

  vpc_id = aws_vpc.commento-vpc.id

  ingress {
    description = "SSH access"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access"
    from_port = 8080
    to_port = 8080
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    description = "HTTP response"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "commento-security-group-alb" {
  tags = {
    Name = "SG-DAI-PRD-ALB"
    Description = "Security for ALB"
  }

  name = "SG-DAI-PRD-ALB"

  vpc_id = aws_vpc.commento-vpc.id
  
  ingress {
    description = "HTTP access port 80"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}