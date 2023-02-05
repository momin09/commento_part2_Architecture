resource "aws_launch_configuration" "commento-launch-configuration" {
  name = "LC-DAI-PRD-INFO-WEB"
  image_id = "ami-013218fccb68a90d4"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.commento-security-group-instance.id]
 /*
  user_data = <<-EOF
		      sudo yum update -y
		      sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
		      sudo yum install -y httpd mariadb-server
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo systemctl is-enabled httpd
		      EOF
 */
}

resource "aws_autoscaling_group" "commento-autoscaling-group" {
  name = "ASG-DAI-PRD-INFO-WEB"
  ## Associate Target Group
  target_group_arns = [aws_lb_target_group.commento-lb-target-group.arn]
  launch_configuration = aws_launch_configuration.commento-launch-configuration.name
  vpc_zone_identifier = [aws_subnet.commento-sub-pub01.id, aws_subnet.commento-sub-pub02.id]

  min_size = 1
  max_size = 3
  
  lifecycle {
    create_before_destroy = true
  }
}