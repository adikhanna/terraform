resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "${var.environment}-rds-subnet-group"
  subnet_ids  = "${var.subnet_ids}"

  tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "rds_sg" {
  name = "${var.environment}-rds-sg"
  vpc_id = "${var.vpc_id}"

  ingress {
      from_port = 5432
      to_port   = 5432
      protocol  = "tcp"
      security_groups = ["${var.security-group-id}", 
                        "${var.ecs-security-group-id}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-rds-sg"
    Environment =  "${var.environment}"
  }
}

resource "aws_db_instance" "rds" {
  identifier             = "${var.environment}-database"
  allocated_storage      = "${var.allocated_storage}"
  engine                 = "postgres"
  engine_version         = "10.6"
  instance_class         = "${var.instance_class}"
  multi_az               = "${var.multi_az}"
  name                   = "${var.database_name}"
  username               = "${var.database_username}"
  password               = "${var.database_password}"
  db_subnet_group_name   = "${aws_db_subnet_group.rds_subnet_group.id}"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true

  tags = {
    Environment = "${var.environment}"
  }
}
