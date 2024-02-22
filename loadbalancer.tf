resource "aws_elb" "monElb" {
  name = "lbapplicatif-grattardmathieu"
  availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  listener {
    instance_port = "80"
    instance_protocol = "http"
    lb_port = "80"
    lb_protocol = "http"
  }

  security_groups = ["sg-0c37b0335fdf3d50d"]

}

resource "aws_lb_target_group" "monTargetGroup" {
  name = "targetgroup-grattardmathieu"
  port = "80"
  protocol = "HTTP"
  vpc_id = var.vpcId
}