variable "ecs-cluster-name" {
    description = "app-cluster"
    default = "app-cluster"
}

variable "ecs-key-pair-name" {
    description = "app-cluster"
    default = "app-cluster"
}

/*====
environment specific variables
======*/

variable "production_database_name" {
  description = "app-db"
}

variable "production_database_username" {
  description = "updata-app"
}

variable "production_database_password" {
  description = "updata-password"
}
