resource "aws_ecs_cluster" "updata-ecs-cluster" {
    name = "${var.ecs-cluster-name}"
}
