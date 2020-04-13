locals {
  instance_count = "1"
}

data "template_file" "container_instance_cloud_config" {
  template = "${file("templates/container-instance.yml.tpl")}"

  vars {
    ecs_cluster_name = "${aws_ecs_cluster.ecs_cluster.name}"
  }
}

data "aws_ssm_parameter" "ecs_amazon_linux_2_recommended_ami_id" {
  # Taken from https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

resource "aws_launch_configuration" "container_instance" {
  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    volume_type = "standard"
    volume_size = "30"
  }

  name_prefix          = "launch_configuration_container_instance_"

  # Amazon ECS-optimized AMI for us-east-1 region
  # image_id = "ami-007571470797b8ffa"
  image_id = "${data.aws_ssm_parameter.ecs_amazon_linux_2_recommended_ami_id.value}"

  instance_type   = "t2.micro"
  key_name        = "${terraform.workspace}"
  security_groups = ["${aws_security_group.allow_vpc.id}"]
  user_data       = "${data.template_file.container_instance_cloud_config.rendered}"
}

variable "enabled_metrics" {
  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

resource "aws_autoscaling_group" "container_instance" {
  lifecycle {
    create_before_destroy = true
  }

  name_prefix               = "aws_autoscaling_group_container_instance_"
  launch_configuration      = "${aws_launch_configuration.container_instance.name}"
  health_check_grace_period = "600"
  health_check_type         = "EC2"
  desired_capacity          = "${local.instance_count}"
  termination_policies      = ["OldestLaunchConfiguration", "Default"]
  min_size                  = "${local.instance_count}"
  max_size                  = "${local.instance_count}"
  enabled_metrics           = ["${var.enabled_metrics}"]
  vpc_zone_identifier       = ["${module.vpc.private_subnets}"]

  tag {
    key                 = "Name"
    value               = "ecs_cluster_instance_m5"
    propagate_at_launch = true
  }
}

#
# ECS resources
#
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "allcollate_cluster"
}

output "ecs_cluster_id" {
  value = "${aws_ecs_cluster.ecs_cluster.id}"
}

output "ecs_cluster_name" {
  value = "${aws_ecs_cluster.ecs_cluster.name}"
}
