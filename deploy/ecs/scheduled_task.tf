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

data "template_file" "service_scheduled_container_definitions" {
  template = "${file("service_scheduled.json.tftemplate")}"

  vars {
    image              = "${var.image}"
    region             = "${local.region}"
    log_group          = "${var.log_group}"
    log_stream_prefix  = "${local.log_stream_prefix}"
    container_port     = "${var.container_port}"
    name               = "${var.container_name}"
    command            = "rake agoda:hotels:update_rates"
  }
}