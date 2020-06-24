resource "aws_ecs_task_definition" "updata-app-definition" {
    family                   = "updata-app-definition"
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = "arn:aws:iam::616690186094:role/ecsTaskExecutionRole"
    container_definitions    = "${template_file.updata-app-template.rendered}"
}