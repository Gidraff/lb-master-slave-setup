#!/usr/bin/env bash

set -e

__setup_pg() {
    # Install postgres
    echo "===Setup Postgres==="
    sudo yum update -y && sudo yum upgrade -y
    sudo yum install -y https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
    if [[ "$?" != 0 ]]; then
        echo "Failed to update packages"
        exit 1
    else
        echo "Installing Postgres ..."
        sudo yum install -y postgresql10-server postgrseql10
        
        # Install patroni
        sudo yum install -y epel-release
        sudo pip install setuptools --upgrade
        sudo pip install psycopg2-binary
        sudo pip install patroni
        sudo pip install python-etcd
    fi
}







main() {
    __setup_pg
}

main
