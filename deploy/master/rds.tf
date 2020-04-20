resource "random_string" "db_password" {
  length  = 24
  special = false
}

resource "aws_ssm_parameter" "aws_db_instance_allcollate_password" {
  name      = "_Allcollate_DBPassword"
  type      = "SecureString"
  value     = "${random_string.db_password.result}"
  overwrite = true
}

resource "aws_db_instance" "allcollate" {
  apply_immediately          = true
  skip_final_snapshot        = true
  final_snapshot_identifier  = "${terraform.workspace}-allcollate-final-snapshot-db"
  identifier                 = "${terraform.workspace}-allcollate-db"
  allocated_storage          = "20"
  storage_type               = "gp2"
  engine                     = "postgres"
  engine_version             = "11.2"
  instance_class             = "db.t2.micro"
  name                       = "allcollate_${terraform.workspace}"
  username                   = "allcollate"
  password                   = "${aws_ssm_parameter.aws_db_instance_allcollate_password.value}"
  db_subnet_group_name       = "${aws_db_subnet_group.default.name}"
  vpc_security_group_ids     = ["${aws_security_group.allow_vpc.id}"]
  backup_retention_period    = 1
  auto_minor_version_upgrade = false
  multi_az                   = false

  lifecycle {
    ignore_changes = ["snapshot_identifier"]
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["${module.vpc.private_subnets}"]
}