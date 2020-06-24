resource "template_file" "updata-app-template" {
  template = "${file("./ecs/task_definition.json")}"

  vars {
    db_host     = "${var.rds-url}"
    db_name     = "${var.rds-dbname}"
    db_user     = "${var.rds-username}"
    db_password = "${var.rds-password}"
  }
}
