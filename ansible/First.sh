#!/bin/bash

#Playbook to install (Node version 18.6.0 - Jenkins - Docker - Add Jenkins to Docker group)
ansible-playbook -i inventory RHEL8-playbook.yaml


#Playbook to Configure Kops instance (kops - kubectl - Jave to make kops a jenkins slave)
ansible-playbook -i inventory kops-conf-Playbook.yaml


#Playbook that will print Jenkins Password
ansible-playbook -i inventory JenkinsPassword.yaml
