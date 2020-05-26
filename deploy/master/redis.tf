resource "aws_elasticache_cluster" "redis" {
  apply_immediately    = true
  cluster_id           = "${terraform.workspace}-redis"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  port                 = 6379
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  security_group_ids   = ["${aws_security_group.allow_vpc.id}"]
  subnet_group_name    = "${aws_elasticache_subnet_group.default.name}"
}

resource "aws_elasticache_subnet_group" "default" {
  name       = "elasticache-subnet"
  subnet_ids = ["${module.vpc.private_subnets}"]
}