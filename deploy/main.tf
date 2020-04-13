variable "image" {
  default = ""
}


variable "container_name" {
  default = "allcollate"
}

variable "max_capacity" {
  default = "1"
}

variable "min_capacity" {
  default = "1"
}

variable "container_port" {
  default = 3000
}

variable "log_group" {
  default = "allcollate_log"

}



locals {
  log_stream_prefix = "allcollate_log_stream_"
  region       = "us-east-1"
}

data "template_file" "service_container_definitions" {
  template = "${file("templates/service.json.tftemplate")}"

  vars {
    image       = "${var.image}"
    region             = "${local.region}"
    log_group          = "${var.log_group}"
    log_stream_prefix  = "${local.log_stream_prefix}"
    container_port     = "${var.container_port}"
    name               = "${var.container_name}"
  }
}

# module "craft_site_service" {
#   source                = "git::https://bitbucket.org/craftmachine/aws-modules//web-ecs-service?ref=feature/update-aws-provider"
#   max_capacity          = "${local.max_capacity}"
#   min_capacity          = "${local.min_capacity}"
#   container_port        = "${local.container_port}"
#   container_name        = "${local.container_name}"
#   external_port         = "${local.container_port}"
#   vpc_id                = "${data.terraform_remote_state.network.vpc_id}"
#   ecs_cluster_id        = "${data.terraform_remote_state.network.web_ecs_cluster_id}"
#   ecs_cluster_name      = "${data.terraform_remote_state.network.web_ecs_cluster_name}"
#   container_definitions = "${data.template_file.service_container_definitions.rendered}"
#   log_group             = "${local.log_group}"
#   internal              = false
#   health_check          = "/ping"
# }

