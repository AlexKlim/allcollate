resource "aws_lb" "lb" {
  name                       = "${terraform.workspace}-lb"
  security_groups            = ["${aws_security_group.lb_container_instance.id}"]
  subnets                    = module.vpc.public_subnets
  enable_deletion_protection = false
}

resource "aws_security_group" "lb_container_instance" {
  vpc_id = "${module.vpc.vpc_id}"

  name        = "${terraform.workspace}_allow_vpc_ecs"
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

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "lb_target" {
  name     = "default"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${module.vpc.vpc_id}"
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.lb_target.arn}"
    type             = "forward"
  }
}

output "lb_listener_arn" {
  value = "${aws_lb_listener.lb_listener.arn}"
}