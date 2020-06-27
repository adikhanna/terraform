
variable "vpc-id" {
  default = "vpc-0622b71126a6771e4"
}

variable "subnet-id-1" {
    default = "subnet-0606c01644116d9ea"
}

variable "subnet-id-2" {
    default = "subnet-09cd524c6e8eb8263"
}

variable "subnet-id-3" {
    default = "subnet-05090e1ba178aa891"
}

variable "subnet-id-4" {
    default = "subnet-0afb1af57fe96aefc"
}

variable "security-group-id" {
    default = "sg-04a2bab962688abb1"
}

variable "rds-security-group" {
    default = "sg-04a2bab962688abb1"
}

variable "rds-url" {
    default = "stg-database.ckpzaxvs5lo5.us-east-2.rds.amazonaws.com"
}

variable "rds-username" {
    default = "appuser"
}

variable "rds-password" {
    default = "updata-password"
}

variable "rds-dbname" {
    default = "appdb"
}

variable "ecs-alb-target" {
    default = "updata-ecs-target-group"
}

variable "ecs-cluster-name" {
    default = "updata-ecs-cluster"
}

variable "ecs-service-role-arn" {
    default = "updata-ecs-cluster"
}

variable "ecs-service-name" {
    default = "updata-ecs-service"
}

variable "ecs-load-balancer-name" {
    default = "updata-ecs-load-balancer"
}

variable "environment" {
    default = "stg"
}

variable "load-balancer-name" {
    description = "The name for the autoscaling group for the cluster."
    default     = "updata-ecs-load-balancer"
}

variable "target-group-name" {
    description = "The name for the target group for the cluster."
    default     = "updata-ecs-target-group"
}