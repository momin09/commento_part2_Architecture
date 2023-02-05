resource "aws_instance" "commento-1st-ec2" {
  tags = {
    Name = "EC2-AN2a-DAI-PRD-INFO-WEB-01"
    Description = "Information Server"
  }

  instance_type = "t2.micro"
  ami = "ami-013218fccb68a90d4"
  key_name = aws_key_pair.tf-key-pair.key_name

  subnet_id = aws_subnet.commento-sub-pub01.id
  vpc_security_group_ids = [aws_security_group.commento-security-group-instance.id]

  user_data = <<-EOF
		      sudo yum update -y
		      sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
		      sudo yum install -y httpd mariadb-server
          sudo systemctl start httpd
          sudo systemctl enable httpd
          sudo systemctl is-enabled httpd
		      EOF
}

resource "aws_instance" "commento-2nd-ec2" {
  tags = {
    Name = "EC2-AN2c-DAI-PRD-INFO-WEB-02"
  }

  instance_type = "t2.micro"
  ami = "ami-013218fccb68a90d4"
  key_name = aws_key_pair.tf-key-pair.key_name

  subnet_id = aws_subnet.commento-sub-pub02.id
  vpc_security_group_ids = [aws_security_group.commento-security-group-instance.id]

  user_data = <<-EOF
		      sudo yum update -y
		      sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
		      sudo yum install -y httpd mariadb-server
          sudo systemctl start httpd
          sudo systemctl enable httpd
          sudo systemctl is-enabled httpd
		      EOF
}