#!/usr/bin/env bash

set -e

# Install HAproxy (load balancer)
__setup_haproxy(){
    sudo yum update -y && sudo yum upgrade -y
    if [[ "$?" != 0 ]]; then
        echo "Failed to update"
        exit 1
    else
        echo "Installing haproxy ..."
        sudo yum install -y epel-release
        if [[ "$?" != 0 ]]; then
            exit 1
        else
            sudo yum install -y haproxy
        fi
    fi
}

main(){
    __setup_haproxy
}

main


