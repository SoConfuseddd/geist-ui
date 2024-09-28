#!/bin/bash

sudo systemctl daemon-reload

sudo apt update && sudo apt install wget -y

cd /tmp/

wget https://get.helm.sh/helm-v3.16.1-linux-amd64.tar.gz

tar -zxvf helm-v3.16.1-linux-amd64.tar.gz

sudo mv /tmp/linux-amd64/helm /usr/local/bin/