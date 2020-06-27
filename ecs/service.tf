resource "aws_alb" "ecs-load-balancer" {
    name                = "${var.load-balancer-name}"
    security_groups     = ["${var.security-group-id}"]
    subnets             = ["${var.subnet-id-1}", "${var.subnet-id-2}"]

    access_logs {
      bucket  = "updata-lb-access-logs"
      enabled = true
  }
}

resource "aws_alb_target_group" "ecs-target_group" {
    name                = "${var.target-group-name}"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${var.vpc-id}"
    target_type         = "ip"
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.ecs-target_group.arn}"
        type             = "forward"
    }
}

resource "aws_security_group" "ecs-security-group" {
  name        = "ecs-security-group"
  description = "allow inbound access from the ALB only"
  vpc_id      = "${var.vpc-id}"

  ingress {
    protocol        = "tcp"
    from_port       = 5000
    to_port         = 5000
    security_groups = ["${var.security-group-id}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_service" "updata-ecs-service" {
  	name            = "${var.ecs-service-name}"
  	cluster         = "${aws_ecs_cluster.updata-ecs-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.updata-app-definition.arn}"
  	desired_count   = 1
    depends_on      = ["aws_alb_listener.alb-listener"]
    launch_type     = "FARGATE"

    network_configuration {
      subnets = ["${var.subnet-id-3}", "${var.subnet-id-4}"]
      security_groups = ["${aws_security_group.ecs-security-group.id}"]
      assign_public_ip = true
    }

  	load_balancer {
      target_group_arn  = "${aws_alb_target_group.ecs-target_group.arn}"
      container_port    = 5000
    	container_name    = "app"
	}

}

resource "aws_cloudwatch_log_group" "updata-ecs-log-group" {
  name = "updata-ecs-log-group"

  tags = {
    Environment = "${var.environment}"
  }
}
