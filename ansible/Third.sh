#!/bin/bash

#Playbook to install on kops instance (Helm - Prometheus)
ansible-playbook -i inventory helm-prometheus-playbook.yaml