variable "pg_slave01_ami_id" {
  default = "ami-0c538ddd14cdd41e8"
}

variable "pg_slave02_ami_id" {
  default = "ami-07bdd69393f9113ba"
}

variable "pg_master_ami_id" {
  default = "ami-0e630c9bc4bbc83d0"
}

variable "haproxy_ami_id" {
  default = "ami-022d69ee6950fdb09"
}

variable "etcd_ami_id" {
  default = "ami-0f752f7a4209bda9d"
}

variable "master_private_ip" {
  default = "172.31.0.132"
}

variable "key_name" {
  default = "pgcluster"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "slave_instance_ips" {
  default = {
    "0" = "172.31.0.133"
    "1" = "172.31.0.134"
  }
}

variable "slave_count" {
  default = 2
}

variable "pub_subnet_id" {}

variable "priv_subnet_id" {}

variable "web_sg" {}

variable "db_sg" {}

variable "etcd_sg" {}
