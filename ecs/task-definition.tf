resource "aws_ecs_task_definition" "updata-app-sample-definition" {
    family                = "updata-app-sample-definition"
    container_definitions = "${template_file.updata-app-template.rendered}"
}
