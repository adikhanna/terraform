variable "environment" {
  default = "prod"
}

variable "subnet_ids" {
  type    = list
  default = ["subnet-0c9ceeab84ec02f67", "subnet-09cd524c6e8eb8263"]
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
