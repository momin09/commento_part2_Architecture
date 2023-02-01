resource "aws_lb" "commento-lb" {
  tags = {
    Name = "ALB-DAI-PRD-INFO-WEB"
    Description = "Load Balancing For Web instance"
  }

  subnets = [aws_subnet.commento-sub-pub01.id, aws_subnet.commento-sub-pub02.id]
  load_balancer_type = "application"
}

resource "aws_lb_target_group" "commento-lb-target-group" {
  tags = {
    Name = "ALB-DAI-PRD-TARGET-G"
    Description = "Load Balancing Target"
  }

  vpc_id = aws_vpc.commento-vpc.id

  port = 3000
  protocol = "HTTPS"
}