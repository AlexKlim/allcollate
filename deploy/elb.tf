resource "aws_lb" "lb" {
  name                       = "${terraform.workspace}-lb"
  security_groups            = ["${aws_security_group.lb_container_instance.id}"]
  subnets                    = ["${module.vpc.public_subnets}"]
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

# resource "aws_lb_listener" "lb_listener_https" {
#   load_balancer_arn = "${aws_lb.lb.arn}"
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2015-05"
#   certificate_arn   = "${data.aws_acm_certificate.domain_craftco_certificate.arn}"

#   default_action {
#     target_group_arn = "${aws_lb_target_group.lb_target.arn}"
#     type             = "forward"
#   }
# }

# resource "aws_route53_record" "lb_route53_record" {
#   zone_id = "${aws_route53_zone.public_zone.zone_id}"
#   name    = ""
#   type    = "A"

#   alias {
#     name                   = "${aws_lb.lb.dns_name}"
#     zone_id                = "${aws_lb.lb.zone_id}"
#     evaluate_target_health = true
#   }
# }

# data "aws_acm_certificate" "domain_craftco_certificate" {
#   domain = "${terraform.workspace == "production" ? "" : format("%s.", terraform.workspace)}craft.co"
# }
