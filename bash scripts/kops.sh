#!/bin/bash

wget https://github.com/kubernetes/kops/releases/download/v1.26.4/kops-linux-amd64

chmod +x kops-linux-amd64

sudo mv kops-linux-amd64 /usr/local/bin/kops