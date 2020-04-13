resource "aws_ecs_task_definition" "task_definition" {
  family                = "${var.container_name}"
  container_definitions = "${data.template_file.service_container_definitions.rendered}"
  network_mode          = "bridge"
}

resource "aws_ecs_service" "service" {
  name                               = "${var.container_name}"
  cluster                            = "${aws_ecs_cluster.ecs_cluster.id}"
  task_definition                    = "${aws_ecs_task_definition.task_definition.arn}"
  desired_count                      = "${var.min_capacity}"
  iam_role                           = "${aws_iam_role.ecs_role.arn}"
  depends_on                         = ["aws_iam_role.ecs_role", "aws_lb_target_group.lb_target", "aws_ecs_task_definition.task_definition"]
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  ordered_placement_strategy {
    type  = "binpack"
    field = "memory"
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.allcollate_lb_target.id}"
    container_name   = "${var.container_name}"
    container_port   = "${var.container_port}"
  }
}

resource "aws_lb_target_group" "allcollate_lb_target" {
  name     = "${var.container_name}"
  port     = "${var.container_port}"
  protocol = "HTTP"
  vpc_id   = "${module.vpc.vpc_id}"

  health_check = {
    path                = "/ping"
    interval            = "300"
    timeout             = "30"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
  }
}

resource "aws_lb_listener_rule" "default" {
  listener_arn = "${aws_lb_listener.lb_listener.arn}"
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.allcollate_lb_target.arn}"
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}

data "aws_iam_policy_document" "iam_policy_document_for_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com", "ec2.amazonaws.com", "application-autoscaling.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ecs_service_role_policy" {
  statement {
    actions = [
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "elasticloadbalancing:RegisterTargets",
      "elasticloadbalancing:DeregisterTargets",
      "ec2:Describe*",
      "ec2:AuthorizeSecurityGroupIngress",
      "ecr:GetAuthorizationToken",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "application-autoscaling:*",
      "ecs:DescribeServices",
      "ecs:UpdateService",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:putMetricAlarm",
      "cloudwatch:putMetricData",
      "ssm:GetParametersByPath",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "ecs_service_role_policy" {
  name   = "ecs_service_role_policy"
  policy = "${data.aws_iam_policy_document.ecs_service_role_policy.json}"
  role   = "${aws_iam_role.ecs_role.id}"
}

resource "aws_iam_role" "ecs_role" {
  name               = "${var.container_name}_ecs_role"
  assume_role_policy = "${data.aws_iam_policy_document.iam_policy_document_for_assume_role.json}"
}

resource "aws_cloudwatch_log_group" "log_group" {
  name              = "${var.log_group}"
  retention_in_days = 90
}

resource "aws_iam_role_policy_attachment" "ec2_service_role" {
  role       = "${aws_iam_role.ecs_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "container_instance" {
  name = "${aws_iam_role.ecs_role.name}"
  role = "${aws_iam_role.ecs_role.name}"
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "${var.container_name}_ecs_instance_profile"
  path = "/"
  role = "${aws_iam_role.ecs_role.name}"
}

resource "aws_appautoscaling_target" "scale_target" {
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_cluster.ecs_cluster.name}/${var.container_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  role_arn           = "${aws_iam_role.ecs_role.arn}"
  min_capacity       = "${var.min_capacity}"
  max_capacity       = "${var.max_capacity}"

  depends_on = [
    "aws_ecs_service.service",
  ]
}

output "aws_lb_target_group_lb_target_arn" {
  value = "${aws_lb_target_group.allcollate_lb_target.arn}"
}
