resource "aws_launch_template" "monLaunchTemplate" {
    name = "launcheTemplate-grattardmathieu"

    image_id = "ami-012ba92271e91512d"

    instance_type = "t2.micro"

    user_data = filebase64("${path.module}/script.sh")

    placement {
        availability_zone = "eu-west-1a"
    }

    network_interfaces {
        associate_public_ip_address = true
        delete_on_termination = true
        security_groups = ["sg-04891020a5d7968f5", aws_security_group.monSecurityGroup.id]
    }

}