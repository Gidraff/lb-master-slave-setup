#!/usr/bin/env bash

set -e

__setup_python() {
    echo "Setting up python..."
    sudo yum  update -y && sudo yum upgrade -y
    if [[ "$?" != 0 ]]; then
        echo "====> Failed to setup py" && exit 1
    fi
    sudo yum install -y gcc python-devel epel-release
    sudo yum install -y python2-pip
}

main(){
    __setup_python
}

main