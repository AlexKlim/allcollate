# agoda_update_hotels

module "scheduled_task" {
  source  = "git::https://github.com/dxw/terraform-aws-ecs-scheduled-task?ref=tags/v1.2"

  name                  = "agoda_update_hotels"
  environment           = "production"
  container_definitions = "${data.template_file.service_scheduled_container_definitions.rendered}"
  schedule_expression   = "cron(0 10 * * ? *)"
  cluster_arn           = "${data.terraform_remote_state.master.ecs_cluster_arn}"
  memory                = 400
  cpu                   = 400
}

resource "aws_cloudwatch_log_group" "log_group_scheduled" {
  name              = "${var.log_group}_scheduled"
  retention_in_days = 90
}

data "template_file" "service_scheduled_container_definitions" {
  template = "${file("service_scheduled.json.tftemplate")}"

  vars {
    image              = "${var.image}"
    region             = "${local.region}"
    log_group          = "${var.log_group}_scheduled"
    log_stream_prefix  = "${local.log_stream_prefix}_scheduled"
    container_port     = "${var.container_port}"
    name               = "${var.container_name}"
    command            = "RAILS_ENV=production rake agoda:hotels:update_rates"
  }
}

# sitemap

module "sitemap_scheduled_task" {
  source  = "git::https://github.com/dxw/terraform-aws-ecs-scheduled-task?ref=tags/v1.2"

  name                  = "sitemap_update"
  environment           = "production"
  container_definitions = "${data.template_file.service_scheduled_sitemap.rendered}"
  schedule_expression   = "cron(0 17 * * * *)"
  cluster_arn           = "${data.terraform_remote_state.master.ecs_cluster_arn}"
  memory                = 400
  cpu                   = 400
}

data "template_file" "service_scheduled_sitemap" {
  template = "${file("service_scheduled.json.tftemplate")}"

  vars {
    image              = "${var.image}"
    region             = "${local.region}"
    log_group          = "${var.log_group}_scheduled"
    log_stream_prefix  = "${local.log_stream_prefix}_scheduled"
    container_port     = "${var.container_port}"
    name               = "${var.container_name}"
    command            = "RAILS_ENV=production rake sitemap:refresh"
  }
}