#!/bin/bash

sudo mkdir /opt/jenkins-slave

sudo apt update

sudo apt install openjdk-11-jdk -y

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

export PATH=$JAVA_HOME/bin:$PATH

source ~/.bashrc

sudo chown ubuntu:ubuntu /opt/jenkins-slave -R

