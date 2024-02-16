resource "aws_security_group" "monSecurityGroup" {
    name = "securitygroup-grattardmathieu"
    vpc_id = "172.31.0.0/16"
}

resource "aws_vpc_security_group_egress_rule" "inboudLoadBalancer" {
    cidr_ipv4 = var.vpc_id
    ip_protocol = "http"
    security_group_id = "aws_security_group.monSecurityGroup.id"
    to_port = 80
    from_port = 80
}

resource "aws_vpc_security_group_egress_rule" "inboundSsh" {
    cidr_ipv4 = var.vpc_id
    ip_protocol = "ssh"
    security_group_id = "aws_security_group.monSecurityGroup.id"
    to_port = 22
    from_port = 80
}