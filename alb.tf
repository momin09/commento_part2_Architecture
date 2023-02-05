resource "aws_lb" "commento-lb" {
  tags = {
    Description = "Load Balancing For Web instance"
  }
  name = "ALB-DAI-PRD-INFO-WEB"
  subnets = [aws_subnet.commento-sub-pub01.id, aws_subnet.commento-sub-pub02.id]
  security_groups = [aws_security_group.commento-security-group-alb.id] 
  load_balancer_type = "application"
}

resource "aws_lb_target_group" "commento-lb-target-group" {
  tags = {
    Description = "Load Balancing Target"
  }

  name = "ALB-DAI-PRD-TARGET-G"
  vpc_id = aws_vpc.commento-vpc.id

  port = 8080
  protocol = "HTTP"
}

resource "aws_lb_target_group_attachment" "commento-target-group-1st-ec2" {
  target_group_arn = aws_lb_target_group.commento-lb-target-group.arn
  target_id = aws_instance.commento-1st-ec2.id
}

resource "aws_lb_target_group_attachment" "commento-target-group-2nd-ec2" {
  target_group_arn = aws_lb_target_group.commento-lb-target-group.arn
  target_id = aws_instance.commento-2nd-ec2.id
}

resource "aws_lb_listener" "commento-lb-listener" {
  tags = {
    Name = "commento-lb-listener"
  }

  load_balancer_arn = aws_lb.commento-lb.arn
  port = "3000"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.commento-lb-target-group.arn
  }
}