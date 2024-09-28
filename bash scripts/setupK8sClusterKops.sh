#!/bin/bash

kops create cluster --name=geist-ui.nadahefnawy.site \
--state=s3://nadahefnawy-geistui-bucket --zones=us-east-1a,us-east-1b \
--node-count=2 --node-size=t2.micro --master-size=t3.medium --dns-zone=geist-ui.nadahefnawy.site \
--node-volume-size=8 --master-volume-size=8

kops update cluster --name=geist-ui.nadahefnawy.site --state=s3://nadahefnawy-geistui-bucket --yes --admin