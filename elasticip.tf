resource "aws_eip" "commento-1st-ec2-eip" {
    lifecycle {
        create_before_destroy = true
    }

    instance = aws_instance.commento-1st-ec2.id
    vpc = true
}

resource "aws_eip" "commento-2nd-ec2-eip" {
    lifecycle {
        create_before_destroy = true
    }

    instance = aws_instance.commento-2nd-ec2.id
    vpc = true
}