#!/bin/bash -xe
sudo yum install -y ruby
sudo yum install -y java 
sudo cd /opt
sudo curl -O https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
