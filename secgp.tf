resource "aws_security_group" "dove-stack-sg" {
  name        = "vpr_stack_SG"
  description = "Sec Grp for dove ssh"
  vpc_id      = aws_vpc.dove.id

  tags = {
    Name = "dove-sg-tag"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_dove" {
  security_group_id = aws_security_group.dove-stack-sg.id
  cidr_ipv4         = var.MYIP
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "engress_dove" {
  security_group_id = aws_security_group.dove-stack-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

