resource "aws_alb" "ecs-load-balancer" {
    name                = "${var.load-balancer-name}"
    security_groups     = ["${var.security-group-id}"]
    subnets             = ["${var.subnet-id-1}", "${var.subnet-id-2}"]
    dns_name            = "${var.dns-name}"
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

resource "aws_lb_listener" "https-alb-listener" {
  load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
  port            = "443"
  protocol        = "HTTPS"
  ssl_policy      = "${var.https-ssl-policy}"
  certificate_arn = "${var.certificate-arn}"

  default_action {
    target_group_arn = "${aws_alb_target_group.ecs-target_group.arn}"
    type             = "forward"
  }
}

output "ecs-load-balancer-name" {
  value = "${aws_alb.ecs-load-balancer.name}"
}

output "ecs-target-group-arn" {
  value = "${aws_alb_target_group.ecs-target_group.arn}"
}

resource "aws_ecs_service" "updata-ecs-service" {
  	name            = "${var.ecs-service-name}"
  	cluster         = "${aws_ecs_cluster.updata-ecs-cluster.id}"
  	task_definition = "${aws_ecs_task_definition.updata-app-definition.arn}"
  	desired_count   = 1
    depends_on      = ["aws_alb_listener.alb-listener"]
    launch_type     = "FARGATE"

    network_configuration {
      subnets = ["${var.subnet-id-1}"]
      security_groups = ["${var.security-group-id}"]
      assign_public_ip = true
    }

  	load_balancer {
      target_group_arn  = "${var.ecs-target-group-arn}"
      container_port    = 5000
    	container_name    = "app"
	}

}
