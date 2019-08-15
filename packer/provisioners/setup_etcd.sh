#!/usr/bin/env bash

set -e

# Install etcd (quorum system)

__setup_etcd() {
    # Update and upgrade
    sudo yum update -y && sudo yum upgrade -y
    if [[ "$?" != 0 ]]; then
        echo "Failed to update"
        exit 1
    else
        # Install etcd (distrubuted configuration manager)
        sudo yum install -y epel-release
        sudo yum install -y etcd
    fi
}

main(){
    __setup_etcd
}

main
