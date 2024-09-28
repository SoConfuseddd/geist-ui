#!/bin/bash


sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine \
                  podman \
                  runc


sudo yum install  yum-utils device-mapper-persistent-data lvm2 -y

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo systemctl start docker

sudo usermod -aG docker $USER

sudo yum install git -y

sudo usermod -aG docker jenkins
sudo systemctl restart jenkins