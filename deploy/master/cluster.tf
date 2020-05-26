#
# Container Instance IAM resources
#
data "aws_iam_policy_document" "container_instance_ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "container_instance_ec2" {
  name               = "container_instance_profile"
  assume_role_policy = "${data.aws_iam_policy_document.container_instance_ec2_assume_role.json}"
}

resource "aws_iam_role_policy" "ssm_role_policy" {
  name   = "ssm_role_policy"
  policy = "${data.aws_iam_policy_document.ssm_role_policy.json}"
  role   = "${aws_iam_role.container_instance_ec2.id}"
}

data "aws_iam_policy_document" "ssm_role_policy" {
  statement {
    effect = "Allow"

    actions = [
      "ssm:DescribeParameters",
      "ssm:GetParameter",
      "ssm:GetParametersByPath",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "ec2_service_role" {
  role       = "${aws_iam_role.container_instance_ec2.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "container_instance" {
  name = "${aws_iam_role.container_instance_ec2.name}"
  role = "${aws_iam_role.container_instance_ec2.name}"
}

#
# ECS Service IAM permissions
#

data "aws_iam_policy_document" "ecs_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ecs_service_role" {
  name               = "ecs_service_role"
  assume_role_policy = "${data.aws_iam_policy_document.ecs_assume_role.json}"
}

resource "aws_iam_role_policy_attachment" "ecs_service_role" {
  role       = "${aws_iam_role.ecs_service_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

data "aws_iam_policy_document" "ecs_autoscale_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["application-autoscaling.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ecs_autoscale_role" {
  name               = "ecs_autoscale_roles"
  assume_role_policy = "${data.aws_iam_policy_document.ecs_autoscale_assume_role.json}"
}

resource "aws_iam_role_policy_attachment" "ecs_service_autoscaling_role" {
  role       = "${aws_iam_role.ecs_autoscale_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceAutoscaleRole"
}

#
# Security group resources
#
resource "aws_security_group" "container_instance" {
  vpc_id = "${module.vpc.vpc_id}"

  name        = "allow_vpc_ecs_cluster"
  description = "Allow vpc traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#
# AutoScaling resources
#

locals {
  ecs_cluster_instance_count = "1"
}

data "template_file" "container_instance_cloud_config" {
  template = "${file("templates/container-instance.yml.tpl")}"

  vars {
    ecs_cluster_name = "${aws_ecs_cluster.ecs_cluster.name}"
  }
}

data "template_cloudinit_config" "container_instance_cloud_config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.container_instance_cloud_config.rendered}"
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
  iam_instance_profile = "${aws_iam_instance_profile.container_instance.name}"

  # Aws EC2 optimize image with Docker 17.09.1-ce
  image_id = "${data.aws_ssm_parameter.ecs_amazon_linux_2_recommended_ami_id.value}"

  instance_type   = "t2.micro"
  key_name        = "${terraform.workspace}"
  security_groups = ["${aws_security_group.container_instance.id}"]
  user_data       = "${data.template_cloudinit_config.container_instance_cloud_config.rendered}"

  associate_public_ip_address = true
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
  desired_capacity          = "${local.ecs_cluster_instance_count}"
  termination_policies      = ["OldestLaunchConfiguration", "Default"]
  min_size                  = "${local.ecs_cluster_instance_count}"
  max_size                  = "${local.ecs_cluster_instance_count}"
  enabled_metrics           = ["${var.enabled_metrics}"]
  vpc_zone_identifier       = ["${module.vpc.public_subnets}"]

  tag {
    key                 = "Name"
    value               = "ecs_cluster_instance"
    propagate_at_launch = true
  }
}

#
# ECS resources
#
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "allcollate_cluster"

  # capacity_providers = ["FARGATE", "FARGATE_SPOT"]
}

#
# CloudWatch resources
#
resource "aws_autoscaling_policy" "container_instance_scale_up" {
  name                   = "aws_autoscaling_policy_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "300"
  autoscaling_group_name = "${aws_autoscaling_group.container_instance.name}"
}

resource "aws_autoscaling_policy" "container_instance_scale_down" {
  name                   = "aws_autoscaling_policy_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "300"
  autoscaling_group_name = "${aws_autoscaling_group.container_instance.name}"
}

output "ecs_cluster_id" {
  value = "${aws_ecs_cluster.ecs_cluster.id}"
}

output "ecs_cluster_arn" {
  value = "${aws_ecs_cluster.ecs_cluster.arn}"
}