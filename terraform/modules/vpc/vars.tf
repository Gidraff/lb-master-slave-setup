variable "region" {
  default = "us-east-1"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "slave_count" {
  default = "2"
}

variable "vpc_cidr" {
  type    = "string"
  default = "10.0.0.0/16"
}

variable "pub_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "priv_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "vpc_id" {}
