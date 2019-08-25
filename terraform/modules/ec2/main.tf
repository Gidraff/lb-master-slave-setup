resource "aws_instance" "master-server" {
  ami                         = "${var.pg_master_ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${var.db_sg}"]
  subnet_id                   = "${var.pub_subnet_id}"
  private_ip                  = "172.31.0.132"
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = "${file("~/.ssh/pgcluster.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo /usr/pgsql-10/bin/postgresql-10-setup initdb",
      "sudo systemctl start postgresql-10",
      "sudo systemctl start patroni",
    ]
  }

  tags {
    Name = "master-instance"
  }
}

resource "aws_instance" "slave-server1" {
  ami                         = "${var.pg_slave01_ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${var.db_sg}"]
  subnet_id                   = "${var.pub_subnet_id}"
  private_ip                  = "172.31.0.133"
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = "${file("~/.ssh/pgcluster.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo /usr/pgsql-10/bin/postgresql-10-setup initdb",
      "sudo systemctl start postgresql-10",
      "sudo systemctl start patroni",
    ]
  }

  tags {
    Name = "slave-instance1"
  }
}

resource "aws_instance" "slave-server2" {
  ami                         = "${var.pg_slave02_ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${var.db_sg}"]
  subnet_id                   = "${var.pub_subnet_id}"
  private_ip                  = "172.31.0.134"
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = "${file("~/.ssh/pgcluster.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo /usr/pgsql-10/bin/postgresql-10-setup initdb",
      "sudo systemctl start postgresql-10",
      "sudo systemctl start patroni",
    ]
  }

  tags {
    Name = "slave-instance2"
  }
}

resource "aws_instance" "etcd-server" {
  ami                         = "${var.etcd_ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${var.etcd_sg}"]
  subnet_id                   = "${var.pub_subnet_id}"
  private_ip                  = "172.31.0.135"
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = "${file("~/.ssh/pgcluster.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl start etcd",
    ]
  }

  tags {
    Name = "etcd-instance"
  }
}

resource "aws_instance" "haproxy-lb" {
  ami                         = "${var.haproxy_ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${var.web_sg}"]
  subnet_id                   = "${var.pub_subnet_id}"
  private_ip                  = "172.31.0.136"
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = "${file("~/.ssh/pgcluster.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl start haproxy",
    ]
  }

  tags {
    Name = "haproxy-lb"
  }
}
