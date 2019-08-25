#!/usr/bin/env bash

__configure_patroni(){
    echo "Configurring patroni..."
    local BOOTSTRAP_SCRIPT=/etc/patroni.yml
    local SRC_DIR=/tmp/master/patroni.yml
    local DEST_DIR=/etc/patroni.yml
    local SERVICE_SCRIPT_SRC=/tmp/master/patroni.service
    local SERVICE_SCRIPT_DEST=/etc/systemd/system/patroni.service
    
    if [[ -e "$BOOTSTRAP_SCRIPT" ]]; then
        sudo rm patron.yml
    else
        sudo cp "$SRC_DIR" "$DEST_DIR"
        sudo cp "$SERVICE_SCRIPT_SRC" "$SERVICE_SCRIPT_DEST"
        
        sudo mkdir -p /data/patroni
        sudo chown -R postgres:postgres /data
        sudo chmod -R 700 /data
    fi
}

main(){
    __configure_patroni
}

main