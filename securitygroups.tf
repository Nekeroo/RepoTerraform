resource "aws_security_group" "monSecurityGroup" {
    name = "securitygroup-grattardmathieu"
    vpc_id = var.vpcId
}

resource "aws_vpc_security_group_egress_rule" "inboudLoadBalancer" {
    cidr_ipv4 = "172.31.0.0/16"
    ip_protocol = -1
    security_group_id = aws_security_group.monSecurityGroup.id
    to_port = 80
    from_port = 80
}

resource "aws_vpc_security_group_egress_rule" "inboundSsh" {
    cidr_ipv4 = "172.31.0.0/16"
    ip_protocol = -1
    security_group_id = aws_security_group.monSecurityGroup.id
    to_port = 22
    from_port = 80
}