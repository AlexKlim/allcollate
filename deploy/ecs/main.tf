variable "image" {
  default = "1"
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
  template = "${file("service.json.tftemplate")}"

  vars {
    image       = "${var.image}"
    region             = "${local.region}"
    log_group          = "${var.log_group}"
    log_stream_prefix  = "${local.log_stream_prefix}"
    container_port     = "${var.container_port}"
    name               = "${var.container_name}"
  }
}