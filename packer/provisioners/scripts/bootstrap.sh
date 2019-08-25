s#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Add EPEL repository
sudo yum install -y epel-release
sudo yum install -y ansible