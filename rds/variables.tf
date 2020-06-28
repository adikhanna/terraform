variable "environment" {
  default = "stg"
}

variable "subnet_ids" {
  type    = list
  default = ["subnet-05090e1ba178aa891", "subnet-0afb1af57fe96aefc"]
}

variable "vpc_id" {
  default = "vpc-0622b71126a6771e4"
}

variable "allowed_security_group_id" {
  default = "sg-04a2bab962688abb1"
}

variable "allocated_storage" {
  default     = "20"
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "multi_az" {
  default     = false
}

variable "database_name" {
  default     = "appdb"
}

variable "database_username" {
  default     = "appuser"
}

variable "database_password" {
  default     = "updata-password"
}
