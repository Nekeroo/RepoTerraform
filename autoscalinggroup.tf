resource "aws_autoscaling_group" "monAutoScalingGroup" {
  name = "autoscaling-grattardmathieu"
  max_size = 2
  min_size = 1
  desired_capacity = 2
  force_delete = true

  launch_template {
    id = aws_launch_template.monLaunchTemplate.id
    version = aws_launch_template.monLaunchTemplate.latest_version
  }

  availability_zones = ["eu-west-1a", "eu-west-1b"]

}