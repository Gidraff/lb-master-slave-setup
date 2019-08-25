output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "priv_subnet_id" {
  value = "${aws_subnet.private_subnet.id}"
}

output "pub_subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}

output "db_sg" {
  value = "${aws_security_group.db_server_sg.id}"
}

output "web_sg" {
  value = "${aws_security_group.haproxy_server_sg.id}"
}

output "etcd_sg" {
  value = "${aws_security_group.etcd_server_sg.id}"
}
